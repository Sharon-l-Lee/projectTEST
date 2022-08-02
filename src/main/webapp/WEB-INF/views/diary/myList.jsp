<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : My List 날짜 파라미터 넘어오는거 보고 수정해야함</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="date">
			<button>이전</button>
			<div class="nowDate">${nowDate }</div>
			<button>이후</button>
		</div>
		<div id="diaryList">
			<c:if test="${not empty myDiaryList }">
				<c:forEach var="mine" items="${myDiaryList }">
					<div class="list" onclick="location.href='${conPath}/diary.do/content?dnum=${mine.dnum }'">
						<span>${mine.dtitle }</span>
						<c:if test="${mine.dstatus eq 0 }">
							<span class="status">비밀 일기</span>
						</c:if>
						<c:if test="${mine.dstatus eq 1 }">
							<span class="status">친구 공개</span>
						</c:if>
						<c:if test="${mine.dstatus eq 0 }">
							<span class="status">전체 공개</span>
							<span class="hit">조회수 : ${mine.dhit }</span>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
			<div id="diary_write" onclick="location.href='${conPath}/diary.do/wirte?mid=${member.mid }&drdate=${nowDate }">
				<span>+</span>
				<span>새로운 일기 쓰기</span>
			</div>
		</div>
		<div id="todo_list">
			<c:forEach var="todo" items="${todoList }">
				
			</c:forEach>
			<div id="todo_make" onclick="location.href='${conPath}/todo.do/make?mid=${member.mid }&drdate=${nowDate }">
				<span>+</span>
				<span>새로운 일기 쓰기</span>
			</div>
		</div>
	</div>
</body>
</html>