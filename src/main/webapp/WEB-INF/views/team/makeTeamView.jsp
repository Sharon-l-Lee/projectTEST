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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function (){
			
		}
	</script>
</head>
<body>
	<form action="${conPath }/team/makeTeam.do" method="post">
		<input type="hidden" name="mid" value="${member.mid }">
		<table>
			<caption>팀만들기</caption>
			<tr>
				<th>팀명</th>
				<td><input type="text" name="tname" required="required"></td>
			</tr>
			<tr>
				<th>팀목표</th>
				<td><input type="text" name="tgoal"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="팀만들기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="reset" value="목록" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>