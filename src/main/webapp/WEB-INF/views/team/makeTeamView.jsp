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
	<link href="${conPath}/css/team/teamDetail.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrap" style="background-image: url('../img/main_wraper.png'); border: 1px solid white">
	<div class="makeTeam">
		<form action="${conPath }/team/makeTeam.do" method="post">
			<input type="hidden" name="mid" value="${member.mid }">
			<table class="makeTeam">
				<tr><td colspan="2"><h4>MAKE GROUP</h4></td></tr>
				<tr>
					<th>GroupName</th>
					<td><input type="text" name="tname" required="required"></td>
				</tr>
				<tr>
					<th>GroupMotto</th>
					<td><input type="text" name="tgoal"></td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="[make]" class="btn">
						<input type="reset" value="[reset]" class="btn">
						<input type="reset" value="[list]" class="btn" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
		<script>
			$(document).ready(function(){
				//인덱스
				$('#teamboard').addClass('nowIndex');
	  		});
		</script>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>