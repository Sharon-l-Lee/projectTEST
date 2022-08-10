<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
		table td {width:50px; height:50px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('select[name="year"], select[name="month"]').change(function(){
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<h2>${year }년 ${month }월</h2>
	<b>
		<form action="${conPath }/calendar.do">
			<select name="year">
				<c:forEach var="i" begin="${year-10 }" end="${year+10 }">
					<c:if test="${i eq year }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != year }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select> 년
			<select name="month">
				<c:forEach var="i" begin="1" end="12">
					<c:if test="${i eq month }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != month }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select> 월
		</form>
	</b>
	<table>
		<tr>
			<c:forEach var="t" items="${calPrint.title }">
				<th>${t }</th>
			</c:forEach>
		</tr>
		<c:forEach var="i" begin="0" end="5">
			<tr>
				<c:forEach var="j" begin="0" end="6">
					<c:if test="${empty calPrint.calDate[i][j] }">
						<td></td>
					</c:if>
					<c:if test="${not empty calPrint.calDate[i][j] }">
						<td onclick="location.href='${conPath}/calendar/dailyList.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }'">
							<h3>${calPrint.calDate[i][j] }</h3>
						</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>