<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/teamboard/content.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function replyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/replyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#replyDiv').html(data);
				}
			});
		}
		function modifyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/modifyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#modifyDiv').html(data);
				}
			});
		}
		$(document).ready(function(){
			// 토글
			$('.toggle').hide();
			$('.toggle_button').click(function(){
				var tcnum = $(this).attr('id');
				$('.toggle'+tcnum).toggle();
				$('.toggle:not(.toggle'+tcnum+')').hide();
			})
		});
	</script>
	<script>
		//인덱스
		$('#myList').addClass('nowIndex');
	</script>
</head>
<body>
	<c:if test="${teamboarddeleteResult eq 1 }">
		<script>
			alert('댓글삭제 성공');
		</script>
	</c:if>
	<c:if test="${teamboarddeleteResult eq 0 }">
		<script>
			alert('댓글삭제 실패');
		</script>
	</c:if>
	<div class="wrap" style="background-image: url('../img/main_wraper.png');">
	<div class="teamBcontent_wrap">
		<table class="teamBcontent">
			<tr>
				<td><h3>${content.ttitle }(${content.thit })</h3></td>
			</tr>
			<tr>
				<td>${content.mname }</td>
			</tr>
			<tr>
				<td>${content.tcontent }</td>
			</tr>
			<tr>
				<td>작성일 : ${content.trdate }</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-bottom: 5px;">
					<input type="button" value="[list]"
						onclick="location.href='${conPath}/teamboard/list.do?pageNum=${pageNum }'"
						class="btn"> 
					<c:if test="${member.mid eq content.mid }">
						<input type="button" value="[modify]"
							onclick="location.href='${conPath}/teamboard/modifyView.do?tnum=${content.tnum}&pageNum=${pageNum }'"
							class="btn"> 
						<input type="button" value="[delete]"
							onclick="location.href='${conPath}/teamboard/delete.do?tnum=${content.tnum}&pageNum=${pageNum }'"
							class="btn">
					</c:if>
				</td>
			</tr>
		</table>
		<form action="${conPath }/teamcomment/write.do" method="post">
			<input type="hidden" name="mid" value="${member.mid }">
			<input type="hidden" name="tnum" value="${content.tnum }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<td>${member.mname }</td>
					<td><input type="text" name="tccontent" required="required"></td>
					<td><input type="submit" value="[write]" class="btn"></td>
				</tr>
			</table>
		</form>
		<div class="teamBCcontent">
			<div class="teamBCcontent_header">&lt; comment &gt; </div>
			<c:if test="${teamCommentTotCnt eq 0 }">
				<p style="margin: 10px auto; text-align: center;">등록된 댓글이 없습니다</p>
			</c:if>
			<c:if test="${teamCommentTotCnt ne 0 or teamCommentTotCnt ne null}">
				<c:forEach items="${teamcommentList }" var="tcDto">
					<div class="teamBCcontent_list">
						<c:if test="${tcDto.tcindent eq 1 }">
				  			<div style="font-size: 0.9em; color: #5D8BF4;">
				  				&nbsp; @${tcDto.tcmention }
				  			</div>
				  		</c:if>
						<div class="Ccomment_mname">${tcDto.mname }</div>
				  		<div class="toggle_button" id="${tcDto.tcnum }">${tcDto.tccontent }</div>
							<div class="toggle toggle${tcDto.tcnum}" id="todoList_btn"
								style="float: right;">
								<button style="border:none; background-color: white; padding: 0 3px;"
									onclick="replyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${tcpaging.currentPage }')">[reply]</button>
								<c:if test="${member.mid eq tcDto.mid }">
									<button style="border:none; background-color: white; padding: 0 3px;"
										onclick="modifyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${tcpaging.currentPage }')">[modify]</button>
									<button style="border:none; background-color: white; padding: 0 3px;"
										onclick="location.href='${conPath}/teamcomment/delete.do?tnum=${content.tnum}&pageNum=${pageNum }&tcnum=${tcDto.tcnum }'">[delete]</button>
								</c:if>
							</div>
						</div>	
				</c:forEach>
				<div id="modifyDiv"></div>
				<div id="replyDiv"></div>
			</c:if>
		</div>
		<div id="paging">
			<c:if test="${tcpaging.startPage > tcpaging.blockSize }">
	  			[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${tcpaging.startPage-1 }"> 이 전 </a>]
	  		</c:if>
		  	<c:forEach var="i" begin="${tcpaging.startPage }" end="${tcpaging.endPage }">
		  		<c:if test="${i eq tcpaging.currentPage }">
		  			[ <b>${i }</b> ]
		  		</c:if>
		  		<c:if test="${i != tcpaging.currentPage }">
		  			[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${i }">${i }</a> ]
		  		</c:if>
		  	</c:forEach>
		  	<c:if test="${tcpaging.endPage < tcpaging.pageCnt }">
		  		[ <a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${tcpaging.endPage+1 }"> 다 음 </a>]
		  	</c:if>
		</div>
		<script>
			$(document).ready(function(){
				//인덱스
				$('#teamboard').addClass('nowIndex');
		  	});
		</script>
	<jsp:include page="../main/header.jsp"/>
	</div>
	</div>
</body>
</html>