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
		function teamDetail(tno){
			location.href = '${conPath}/team/teamDetailView.do?tno='+tno;
		}
		function myteamDetail(tno){
			location.href = '${conPath}/team/teamDetailView.do?tno='+tno;
		}
	</script>
</head>
<body>
	<table>
		<tr>
			<td><a href="${conPath}/team/makeTeamView.do">그룹만들기</a></td>
		</tr>
	</table>
	<table>
		<caption>나의 그룹</caption>
		<tr>
			<th>그룹명</th>
			<th>팀장</th>
		</tr>
		<c:if test="${myteamList.size() eq 0 }">
			<tr>
				<td colspan="2">등록된 그룹이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${myteamList.size() ne 0 }">
			<c:forEach items="${myteamList }" var="list">
				<tr	onclick="myteamDetail(${list.tno})">
	  				<td>${list.tname }</td>
	  				<td>${list.mid }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>
	<table>
		<caption>신청한 그룹</caption>
		<tr>
			<th>그룹명</th>
			<th>팀장</th>
		</tr>
		<c:if test="${myapplyteamList.size() eq 0 }">
			<tr>
				<td colspan="2">신청한 그룹이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${myapplyteamList.size() ne 0 }">
			<c:forEach items="${myapplyteamList }" var="applylist">
				<tr	onclick="teamDetail(${applylist.tno})">
	  				<td>${applylist.tname }</td>
	  				<td>${applylist.mid }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>