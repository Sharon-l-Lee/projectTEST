<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/member/result.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
			<table>
				<col style="width : 200px;">
				<col style="width : 200px;">
				<tr>
					<th colspan="2">검색결과</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${mid }</td>
				</tr>
			</table>
		<div>
			<p>
				입력하신 이메일로 비밀번호를 발송하였습니다.
			</p>
			<button onclick="window.close()">닫기</button>
		</div>
	</div>
</body>
</html>