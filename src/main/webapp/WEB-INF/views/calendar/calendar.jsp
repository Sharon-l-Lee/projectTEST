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
<link href="${conPath }/css/calendar/calendar.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('select[name="year"], select[name="month"]').change(function() {
			$('form').submit();
		});

		$('#calendar').addClass('nowIndex');
	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="calendar_wrap">
				<div id="headDate">
					<h2>${year }년${month }월</h2>
				</div>
				<form action="${conPath }/calendar.do">
					<div class="yearMonth">
						<select name="year" class="select">
							<c:forEach var="i" begin="${year-10 }" end="${year+10 }">
								<c:if test="${i eq year }">
									<option selected="selected">${i }</option>
								</c:if>
								<c:if test="${i != year }">
									<option>${i }</option>
								</c:if>
							</c:forEach>
						</select> <select name="month" class="select">
							<c:forEach var="i" begin="1" end="12">
								<c:if test="${i eq month }">
									<option selected="selected">${i }</option>
								</c:if>
								<c:if test="${i != month }">
									<option>${i }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
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
									<td
										onclick="location.href='${conPath}/calendar/dailyList.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }'">
										<h3>${calPrint.calDate[i][j] }</h3>
									</td>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				</form>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>