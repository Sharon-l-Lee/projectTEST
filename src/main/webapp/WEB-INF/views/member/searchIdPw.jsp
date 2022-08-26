<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link href="${conPath}/css/member/search.css" rel="stylesheet">
</head>
<body>
	<c:if test="${searchResult != null }">
		<script>
			alert('${searchResult}')
		</script>
	</c:if>
	<div id="wrap">
		<form action="${conPath }/member/searchIdPw.do" method="post">
			<table>
				<caption><h3>아이디 찾기</h3></caption>
				<col style="width : 200px;">
				<tr>
					<td><input type="text" name="mname" class="mname" value="${mname }" placeholder="NICKNAME"></td>
				</tr>
				<tr>
					<td>
						<input type="email" name="memail" class="memail" id="memail" value="${memail }" placeholder="EMAIL">
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