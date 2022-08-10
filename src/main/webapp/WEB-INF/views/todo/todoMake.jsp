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
	<form action="${conPath }/todo/make.do" method="post" id="todo_form">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="ddate" value="${param.tdrdate }">
		<input type="hidden" name="tdrdate" value="${param.tdrdate }">
		<input type="text" id="tdcontent" name="tdcontent" autofocus="autofocus">
		<input type="submit" value="등록">
	</form>
</body>
</html>