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
	<form action="${conPath }/diaryReply/modify.do" method="post" id="replyFrm">
		<input type="hidden" name="drnum" value="${param.drnum }">
		<input type="hidden" name="dnum" value="${reply.dnum }">
		<input type="hidden" name=returnInt value="1">
		<input type="text" name="drcontent" id="drcontent" value="${reply.drcontent }" required="required">
		<input type="submit" class="submit" value="수정">
	</form>
</body>
</html>