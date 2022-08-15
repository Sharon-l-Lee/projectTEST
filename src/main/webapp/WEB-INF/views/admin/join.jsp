<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">

			<h2>관리자 등록</h2>
			<div id="register">
				<form action="${conPath }/admin/join.do" method="post">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="aid"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="text" name="apw"></td>
						</tr>
						<tr>
							
							<td colspan="2"><input type="submit" value="등록"></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
</body>
</html>