<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			var pageCnt = Number('${append.pageCnt}');
			var totCnt = Number('${append.totCnt}');
			if(totCnt<=5){
				$('.appendAlert').css('display','none');
			}
			$('.appendAlert').click(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum=1;
				}
				$.ajax({
					url : '${conPath}/alert/append.do',
					type : 'get',
					dataType : 'html',
					data : {"pageNum":(pageNum+1)},
					success : function(data){
						$('#appendDiv').append(data);
						pageNum = Number($('.pageNum').last().val());
						if(pageCnt <= pageNum){
							$('.appendAlert').css('display','none');
						}
					}
				});
			});
			
			$('form').submit(function(){
				$.ajax({
					url : '${conPath}/alert/read.do',
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#list').html(data);
					}
				});
			});
		});
	</script>
</head>
<body>
	<div id="list">
		<form>
			<table>
				<caption><input type="submit" value="모든알림읽음"></caption>
				<c:if test="${empty alerts }">
					<tr>
						<td>알림이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty alerts }">
					<c:forEach items="${alerts }" var="alert">
						<tr>
							<td 
							<c:if test="${alert.alcheck eq 0 }">
								style="font-weight : bold;"
							</c:if>
							>
								<input type="hidden" name="alno" value="${alert.alno }">
								${alert.midname }(${alert.mid })님이 ${alert.fidname }(${alert.fid })님을 ${alert.codename }하였습니다
								<br><fmt:formatDate value="${alert.aldate }" pattern="MM월 dd일"/> 
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</form>
		<div id="appendDiv"></div>
		<button class="appendAlert">더보기</button>
	</div>
</body>
</html>