
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<form action ="${conPath}/reply/comment.do"  method="post">
		<input type="hidden" name="rnum" value="${param.rnum }">
		<input type="hidden" name="rpnum" value="${param.rpnum }">
		<textarea rows="5" cols="10" id="rpcontent" name="rpcontent">나</textarea>
		<input type="submit" value="작성">
		<button onclick="history.back()">취소</button>
	</form>

</body>
</html>