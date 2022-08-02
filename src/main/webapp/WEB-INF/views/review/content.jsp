
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
<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<div id="title">
		${reviewContent.rtitle } <!-- 태그도 넣기 -->
	</div>
	<div id="nav">
		${reviewContent.rrdate } / ${reviewContent.mname }
	</div>
	
	<div id="content">
		${reviewContent.rcontent }
	</div>
	
	<button onclick="location.href='${conPath}/review/modify.do?rnum=${reviewContent.rnum}'">수정</button>
	<button onclick="location.href='${conPath}/review/delete.do?rnum=${reviewContent.rnum}'">삭제</button>
</body>
</html>