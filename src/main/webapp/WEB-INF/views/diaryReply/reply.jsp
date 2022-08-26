<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/reply/replyForm.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/diaryReply/reply.do" method="post" id="replyFrm">
		<input type="hidden" name="drnum" value="${param.drnum }">
		<input type="hidden" name="dnum" value="${param.dnum }">
		<input type="text" name="drcontent" id="drcontent" required="required">
		<input type="submit" class="submit" value="작성">
	</form>
</body>
</html>