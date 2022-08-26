<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/diary/form.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/todo/modify.do" method="post" id="todo_form">
		<input type="hidden" name="tdno" value="${param.tdno }">
		<input type="hidden" name="ddate" value="${param.ddate }">
		<input type="text" id="tdcontent" name="tdcontent" value="${param.tdcontent }" autofocus="autofocus">
		<input type="submit" value="저장" class="button">
		<input type="button" value="취소" class="button" onclick="location.href='${conPath}/diary/myList.do?ddate=${param.ddate}'">
	</form>
</body>
</html>