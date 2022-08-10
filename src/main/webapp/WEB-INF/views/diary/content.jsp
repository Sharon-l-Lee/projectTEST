<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$('.reply_modify_button').click(function(){
				var drnum = $(this).attr('name');
				$.ajax({
					url : '${conPath}/diaryReply/modify.do',
					data : 'drnum='+drnum,
					type : 'get',
					success : function(data){
						$('#'+drnum).html(data);
					}
				})
			});
			$('.reply_form_button').click(function(){
				var drnum = $(this).attr('name');
				var dnum = '${diary.dnum}';
				$.ajax({
					url : '${conPath}/diaryReply/reply.do',
					data : 'drnum='+drnum+"&dnum="+dnum,
					type : 'get',
					success : function(data){
						$('.reply_form'+drnum).html(data);
					}
				})
			});
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="content_wrap">
			<table>
				<tr>
					<th>제목</th>
					<td>${diary.dtitle }</td>
				</tr>
				<c:if test="${not empty todoList }">
					<tr> 
						<th rowspan="${todoList.size()+1 }">투두리스트</th>
						<td>내용</td>
					</tr>
					<c:forEach var="todo" items="${todoList }">
						<tr>
							<td>${todo.tdcontent }</td>
							<td>${todo.tdcheck }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<th>내용</th>
					<td>${diary.dcontent }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${diary.drdate }</td>
				</tr>
				<tr>
					<th>해당일</th>
					<td>${diary.ddate }</td>
				</tr>
			</table>
			<button onclick="location.href='${conPath}/diary/myList.do?ddate=${diary.ddate }'">목록</button>
			<button onclick="location.href='${conPath}/diary/modify.do?dnum=${diary.dnum}&ddate=${diary.ddate }'">수정</button>
			<button onclick="location.href='${conPath}/diary/delete.do?dnum=${diary.dnum}&ddate=${diary.ddate }'">삭제</button>
		</div>
		<div id="reply_wrap">
			<div id="reply_write">
				<form action="write.do" method="post">
					<input type="hidden" name="dnum" value="${diary.dnum }">
					<input type="text" name="drcontent" value="${drcontent }">
					<input type="submit" value="작성">
				</form>
			</div>
			<c:forEach var="reply" items="${diaryReplyList }">
				<div id="${reply.drnum }">
					<c:if test="${reply.drindent eq 1 }">
					└
					</c:if>
					<span>${reply.mname }</span>
					<c:if test="${reply.drmention != null }">
						<span>@${reply.drmention }</span>
					</c:if>
					<span>${reply.drcontent }</span>
					<span>${reply.drrdate }</span>
					<c:if test="${reply.mid eq member.mid }">
						<button class="reply_modify_button" name="${reply.drnum }">수정</button>
						<button onclick="location.href='${conPath}/diaryReply/delete.do?drnum=${reply.drnum }&dnum=${diary.dnum }'">삭제</button>
					</c:if>
					<button class="reply_form_button" name="${reply.drnum }">답글</button>
					<div class="reply_form${reply.drnum }"></div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>