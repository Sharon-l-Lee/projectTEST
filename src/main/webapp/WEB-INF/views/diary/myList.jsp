<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Today</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<link href="${conPath }/css/diary/myList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			// 토글
			$('.toggle').hide();
			$('.toggle_button').click(function(){
				var tdno = $(this).attr('id');
				var x = event.pageX;
				var y = event.pageY;
				$('.toggle'+tdno).css({
					"left" : x+20,
					"top" : y-43
				});
				$('.toggle'+tdno).toggle();
				$('.toggle:not(.toggle'+tdno+')').hide();
			})
			
			// 투두 만들기
			$('#todo_make').click(function(){
				var nowDate =  '${nowDate }';
				$.ajax({
					url : '${conPath}/todo/make.do',
					data : 'tdrdate='+nowDate,
					type : 'get',
					success : function(data){
						$('#todo_make_form').html(data);
					}
				})
			});
			
			// 투두 수정
			$('.todoModify').click(function(){
				var tdno = $(this).attr('name');
				var tdcontent = $('.tdcontent'+tdno).text();
				var nowDate =  '${nowDate }';
				$.ajax({
					url : '${conPath}/todo/modify.do',
					data : 'tdno='+tdno+'&tdcontent='+tdcontent+'&ddate='+nowDate,
					type : 'get',
					success : function(data){
						$('#todo'+tdno).html(data);
					}
				})
			});
			
			//체크하기
			$('.check').click(function(){
				var tdno = $(this).attr('name');
				var nowDate =  '${nowDate }';
				location.href = '${conPath}/todo/check.do?tdno='+tdno+'&nowDate='+nowDate;
			});
						
			// 다이어리 쓰기로 이동
			$('#diary_write').click(function(){
				location.href="${conPath}/diary/write.do?ddate=${nowDate }";
			})
			
			// 주말은 빨간색
			var day = $('.day').text().trim();
			if(day == "Sat" || day == "Sun"){
				$('.ifred').addClass('weekend');
			}
			
			//인덱스
			$('#myList').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="date_wrap">
				<div id="date">
					<div class="before button" onclick="location.href='${conPath }/diary/myList.do?ddate=${before }'">&lt;</div>
					<div class="nowDate">
						<div class="year_month">
							<fmt:setLocale value="en_US" scope="session"/>
							<fmt:formatDate value="${nowDate }" pattern="yyyy.MM"/>
						</div>
						<div class="date ifred">
							<fmt:formatDate value="${nowDate }" pattern="dd"/>
						</div>
						<div class="day ifred">
							<fmt:formatDate value="${nowDate }" pattern="E" dateStyle="full" timeStyle="full"/>
						</div>
					</div>
					<div class="after button" onclick="location.href='${conPath }/diary/myList.do?ddate=${after }'">&gt;</div>
				</div>
			</div>
			<div id="list_wrap">
				<div id="diary_wrap">
					<div id="diaryList">
						<div id="list_title">TODAY DIARY</div>
						<c:forEach var="diary" items="${diaryList }">
							<div class="list" onclick="location.href='${conPath }/diary/content.do?dnum=${diary.dnum }'">
								<span class="title">${diary.dtitle }</span>
								<c:if test="${diary.dstatus eq 0 }">
									<span class="status">비밀 일기</span>
								</c:if>
								<c:if test="${diary.dstatus eq 1 }">
									<span class="status">친구 공개</span>
								</c:if>
								<c:if test="${diary.dstatus eq 2 }">
									<span class="status">전체 공개</span>
								</c:if>
								<span class="drdate">작성일 | <fmt:formatDate value="${diary.drdate }" pattern="yyyy.MM.dd"/></span>
								<c:if test="${diary.dstatus >= 1 }">
									<span class="hit">조회수 | ${diary.dhit }</span>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<div id="diary_write">WRITE NEW DIARY</div>
					<div class="paging">
						<c:if test="${paging.startPage > paging.blockSize }">
							<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${paging.startPage-1 }&tdPageNum=${todoPaging.currentPage}">[ 이전 ]</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
							<c:if test="${i eq paging.currentPage }">
								[ <b>${i }</b> ]
							</c:if>
							<c:if test="${i != paging.currentPage }">
								<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${i}&tdPageNum=${todoPaging.currentPage }">[ ${i } ]</a>
							</c:if>
						</c:forEach>
						<c:if test="${ paging.endPage < paging.pageCnt }">
							<a href="${conPath }/diary/myList.do?ddate=${nowDate }&pageNum=${paging.endPage + 1 }&tdPageNum=${todoPaging.currentPage}">[ 다음 ]</a>
						</c:if>
					</div>
				</div>
				<div id="todo_wrap">
					<div id="todo_list">
						<c:forEach var="todo" items="${todoList }">
							<div id="todo${todo.tdno }" class="todo_one">
								<div class="todo_content">
									<img alt="체크이미지${todo.tdcheck }" src="${conPath }/img/check${todo.tdcheck }.png" class="check${todo.tdno } check" name="${todo.tdno }">
									<span class="tdcontent${todo.tdno } content">${todo.tdcontent }</span>
									<span class="toggle_button" id="${todo.tdno }">···</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<div id="todo_make_form">
						<div id="todo_make">MAKE TODO</div>
					</div>
					<div class="paging">
						<c:if test="${todoPaging.startPage > todoPaging.blockSize }">
							<a href="${conPath }/diary/myList.do?ddate=${nowDate }&tdPageNum=${todoPaging.startPage-1 }&pageNum=${paging.currentPage }">[ 이전 ]</a>
						</c:if>
						<c:forEach var="i" begin="${todoPaging.startPage }" end="${todoPaging.endPage }">
							<c:if test="${i eq todoPaging.currentPage }">
								[ <b>${i }</b> ]
							</c:if>
							<c:if test="${i != todoPaging.currentPage }">
								<a href="${conPath }/diary/myList.do?ddate=${nowDate }&tdPageNum=${i}&pageNum=${paging.currentPage }">[ ${i } ]</a>
							</c:if>
						</c:forEach>
						<c:if test="${ todoPaging.endPage < todoPaging.pageCnt }">
							<a href="${conPath }/diary/myList.do?ddate=${nowDate }&tdPageNum=${todoPaging.endPage + 1 }&pageNum=${paging.currentPage }">[ 다음 ]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
	<c:forEach var="todo" items="${todoList }">
		<div class="toggle toggle${todo.tdno}">
			<button class="todoDelay" onclick="location.href='${conPath}/todo/check.do?tdno=${todo.tdno }&tdcheckStr=1&nowDate=${nowDate }'">미루기</button>
			<button class="todoModify" name="${todo.tdno}">수정</button>
			<button onclick="location.href='${conPath}/todo/delete.do?tdno=${todo.tdno }'">삭제</button>
		</div>
	</c:forEach>
</body>
</html>