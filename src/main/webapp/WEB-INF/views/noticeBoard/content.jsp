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
			
		});
	</script>
</head>
<body>
	<c:if test="${updateResult eq 0 }">
		<script>
			alert('수정실패');
		</script>
	</c:if>
	<c:if test="${updateResult eq 1 }">
		<script>
			alert('공지사항이 수정되었습니다');
		</script>
	</c:if>
	<div class="content">
			<table>
				<col style="width : 200px;">
				<col style="width : 600px;">
				<tr>
					<th>제목</th>
					<td>${notice.ntitle }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${notice.nrdate }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="height : 200px;"><pre>${notice.ncontent }</pre></td>
				</tr>
			</table>
			<div class="btn_wrap">
				<c:if test="${admin != null }">
					<button onclick="location.href='${conPath}/notice/updateView.do?nno=${notice.nno }&pageNum=${param.pageNum}'">수정</button>
					<button onclick="location.href='${conPath}/notice/delete.do?nno=${notice.nno }&pageNum=${param.pageNum}'">삭제</button>
				</c:if>
				<button onclick="location.href='${conPath}/notice/list.do?pageNum=${param.pageNum}'">목록</button>
			</div>
		</div>
</body>
</html>