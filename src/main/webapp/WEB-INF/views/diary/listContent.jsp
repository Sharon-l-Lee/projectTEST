<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Log : Diary Content</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="${conPath }/css/diary/content.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$('.reply_modify_button').click(function(){
				var drnum = $(this).attr('name');
				var returnInt = '${param.returnInt }';
				$.ajax({
					url : '${conPath}/diaryReply/modify.do',
					data : 'drnum='+drnum+'&returnInt='+returnInt,
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
			$('#diary').addClass('nowIndex');
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
					<div class="writer">
						<span>${diary.mname }</span>
					</div>
					<div class="button">
						<c:if test="${member.mid eq diary.mid }">
							<button onclick="location.href='${conPath}/diary/delete.do?dnum=${diary.dnum}&returnInt=1'">삭제</button>
							<button onclick="location.href='${conPath}/diary/modify.do?dnum=${diary.dnum}&returnInt=1'">수정</button>
						</c:if>
						<button onclick="location.href='${conPath}/diary/diaryList.do?pageNum=${param.pageNum }'">목록</button>
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
			<c:if test="${diary.dstatus > 0 }">
				<div id="reply_wrap">
					<div id="reply_write">
						<form action="${conPath }/diaryReply/write.do" method="post" id="replyFrm">
							<input type="hidden" name="returnInt" value="1">
							<input type="hidden" name="dnum" value="${diary.dnum }">
							<input type="text" name="drcontent" id="drcontent" required="required">
							<input type="submit" class="submit" value="작성">
						</form>
					</div>
					<div id="reply_content">
						<c:forEach var="reply" items="${diaryReplyList }">
							<div id="${reply.drnum }" class="reply_one">
								<div class="indent">
									<c:if test="${reply.drindent eq 1 }">
									└
									</c:if>
								</div>
								<div class="content">
									<div class="writer">${reply.mname }</div>
									<c:if test="${reply.drmention != null }">
										<span>@${reply.drmention }</span>
									</c:if>
									<span>${reply.drcontent }</span>
									<div class="date">${reply.drrdate }</div>
									<div class="button">
										<c:if test="${reply.mid eq member.mid }">
											<button class="reply_modify_button" name="${reply.drnum }">수정</button>
											<button onclick="location.href='${conPath}/diaryReply/delete.do?drnum=${reply.drnum }&dnum=${diary.dnum }&returnInt=1'">삭제</button>
										</c:if>
										<button class="reply_form_button" name="${reply.drnum }">답글</button>
									</div>
								</div>
								<div class="reply_form${reply.drnum } reply_form"></div>
							</div>
						</c:forEach>
						<div class="paging">
							<c:if test="${rPaging.startPage > rPaging.blockSize }">
								<a href="${conPath }/diary/content.do?dnum=${diary.dnum }&returnInt=1&rPageNum=${rPaging.startPage-1 }">[ 이전 ]</a>
							</c:if>
							<c:forEach var="i" begin="${rPaging.startPage }" end="${rPaging.endPage }">
								<c:if test="${i eq rPaging.currentPage }">
									[ <b>${i }</b> ]
								</c:if>
								<c:if test="${i != rPaging.currentPage }">
									<a href="${conPath }/diary/content.do?dnum=${diary.dnum }&returnInt=1&rPageNum=${i}">[ ${i } ]</a>
								</c:if>
							</c:forEach>
							<c:if test="${ rPaging.endPage < rPaging.pageCnt }">
								<a href="${conPath }/diary/content.do?dnum=${diary.dnum }&returnInt=1&rPageNum=${rPaging.endPage + 1 }">[ 다음 ]</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>