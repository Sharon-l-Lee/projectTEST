<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/admin/login.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){
		$('#adminLogin').addClass('nowIndex');
	});
	</script>
</head>
<body>
<div id="main_wrap">
	<div id="wrap">
	<div id="login_wrap">
	<form action="${conPath }/admin/login.do" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="aid" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="apw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn">
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<jsp:include page="../main/header.jsp"/>
</div>
</body>
</html>