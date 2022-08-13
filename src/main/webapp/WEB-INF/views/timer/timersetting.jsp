<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/timersetting.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="tform">
			<form action="view.do">
				<div class="name">
					${member.mname } 's TIMER
				</div>
				<input type="text" name="tname" placeholder="어떤 작업?"><br>
				<input type="number" name="tdo" placeholder="얼마나?(숫자입력)" min="0" max="100"><br> 
				<input type="submit"value="시작!" class="btn">

			</form>
		</div>
	</div>
</body>
</html>