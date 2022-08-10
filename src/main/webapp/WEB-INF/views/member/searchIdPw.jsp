<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script	 src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
			$(document).ready(function(){
				
			});
	</script>
</head>
<body>
	<c:if test="${searchResult != null }">
		<script>
			alert('${searchResult}')
		</script>
	</c:if>
	<div>
		<form action="${conPath }/member/searchIdPw.do" method="post">
			<table>
				<caption>아이디 찾기</caption>
				<col style="width : 200px;">
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="mname" class="mname" value="${mname }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="memail" class="memail" id="memail" value="${memail }">
					</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="찾기" class="btn">
				<input type="button" value="취소" class="btn" onclick="window.close()">
			</div>
		</form>
	</div>
</body>
</html>