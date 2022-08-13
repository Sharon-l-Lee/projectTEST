<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Diary List</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="diaryList">
			<c:forEach var="diary" items="${diaryList }">
				<div class="list" onclick="location.href='${conPath }/diary/content.do?dnum=${diary.dnum }&returnInt=1'">
					<span>${diary.dtitle }</span>
					<c:if test="${diary.dstatus eq 0 }">
						<span class="status">비밀 일기</span>
					</c:if>
					<c:if test="${diary.dstatus eq 1 }">
						<span class="status">친구 공개</span>
					</c:if>
					<c:if test="${diary.dstatus eq 2 }">
						<span class="status">전체 공개</span>
						<span class="hit">조회수 : ${diary.dhit }</span>
					</c:if>
					<span class="drdate">작성일 : ${diary.drdate }</span>
				</div>
			</c:forEach>
			<div class="paging">
				<c:if test="${paging.startPage > paging.blockSize }">
					<a href="${conPath }/diary/diaryList.do?pageNum=${paging.startPage-1 }">[ 이전 ]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${i eq paging.currentPage }">
						[ <b>${i }</b> ]
					</c:if>
					<c:if test="${i != paging.currentPage }">
						<a href="${conPath }/diary/diaryList.do?pageNum=${i}">[ ${i } ]</a>
					</c:if>
				</c:forEach>
				<c:if test="${ paging.endPage < paging.pageCnt }">
					<a href="${conPath }/diary/diaryList.do?pageNum=${paging.endPage + 1 }">[ 다음 ]</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>