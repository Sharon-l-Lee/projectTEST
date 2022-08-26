<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Log : My Content</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="${conPath }/css/diary/privateContent.css" rel="stylesheet">
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
			
			//인덱스
			$('#myList').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="content_wrap">
				<div id="content">
					<div class="date">
						<fmt:formatDate value="${diary.ddate }" pattern="yyyy년 MM월 dd일 일기"/>
					</div>
					<div class="title">
						<span>${diary.dtitle }</span>
					</div>
					<div class="button">
						<button onclick="location.href='${conPath}/diary/delete.do?dnum=${diary.dnum}&ddate=${diary.ddate }'">삭제</button>
						<button onclick="location.href='${conPath}/diary/modify.do?dnum=${diary.dnum}&ddate=${diary.ddate }'">수정</button>
						<button onclick="location.href='${conPath}/diary/${path }?ddate=${diary.ddate }'">목록</button>
					</div>
					<div class="content_title">내용</div>
					<div class="content">
						<c:if test="${not empty todoList }">
							<div id="todoList">
								<div class="todo_wrap">
									<div class="todo">
										<c:forEach var="todo" items="${todoList }">
											<div class="todo_one">
												<img alt="체크이미지${todo.tdcheck }" src="${conPath }/img/check${todo.tdcheck }.png" class="check${todo.tdno } check">
												<span>${todo.tdcontent }</span>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:if>
						<div class="diary_content">
							${diary.dcontent }
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>