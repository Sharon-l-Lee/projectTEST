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
	<link href="${conPath}/css/team/myteamList.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function teamDetail(tno){
			location.href = '${conPath}/team/teamDetailView.do?tno='+tno+'&mid=${member.mid}';
		}
		function myteamDetail(tno){
			location.href = '${conPath}/team/myTeamDetailView.do?tno='+tno+'&mid=${member.mid}';
		}
	</script>
</head>
<body>
	<c:if test="${applyTeamMemberResult  eq 1}">
		<script>
			alert('그룹가입 신청 완료');
		</script>
	</c:if>
	<c:if test="${applyTeamMemberResult  eq 0}">
		<script>
			alert('그룹가입 신청 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${deleteApplyTeamResult  eq 1}">
		<script>
			alert('그룹가입 신청철회 완료');
		</script>
	</c:if>
	<c:if test="${deleteApplyTeamResult  eq 0}">
		<script>
			alert('그룹가입 신청철회 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${teamDeleteResult  eq 1}">
		<script>
			alert('그룹삭제 완료');
		</script>
	</c:if>
	<c:if test="${teamDeleteResult  eq 0}">
		<script>
			alert('그룹삭제 실패');
			history.back();
		</script>
	</c:if>
	
<div class="wrap" style="background-image: url('../img/main_wraper.png'); border:1px solid white;">
	<div class="myTeamList_wrap">
	<div class="myTeamListHeader">
		<div><h2>MY GROUP LIST</h2></div>
		<div><a href="${conPath}/team/makeTeamView.do">[그룹만들기]</a></div>
	</div>
	<div class="myList">
		<div class="myTeamList">
		<table>
			<tr><td colspan="2"><h4>MY GROUP LIST</h4></td></tr>
			<tr>
				<th>그룹명</th>
				<th>팀장</th>
			</tr>
			<c:if test="${empty myteamList }">
				<tr>
					<td colspan="2">등록된 그룹이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty myteamList }">
				<c:forEach items="${myteamList }" var="list">
					<tr	onclick="myteamDetail(${list.tno})">
		  				<td>${list.tname }</td>
		  				<td>${list.mname }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
		<div class="myApplyTeamList">
		<table>
			<tr><td colspan="2"><h4>MY APPLY LIST</h4></td></tr>
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
		  				<td>${applylist.mname }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			//인덱스
			$('#group').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
	</div>
</div>
</body>
</html>