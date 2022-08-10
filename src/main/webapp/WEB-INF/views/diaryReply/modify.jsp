<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<form action="${conPath }/diaryReply/modify.do" method="post">
		<input type="hidden" name="drnum" value="${param.drnum }">
		<input type="hidden" name="dnum" value="${reply.dnum }">
		<input type="text" name="drcontent" value="${reply.drcontent }">
		<input type="submit" value="수정">
	</form>
</body>
</html>