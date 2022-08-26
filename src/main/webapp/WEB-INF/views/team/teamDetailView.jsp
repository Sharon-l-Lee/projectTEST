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
<link href="${conPath}/css/team/teamDetail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
		function (){
			
		}
	</script>
</head>
<body>
<div class="wrap" style="background-image: url('../img/main_wraper.png'); border: 1px solid white">
	<div class="myTeamDetail">
		<table class="myTeamDetail">
			<tr>
				<td colspan="2">
					<h4>[${teamDetail.tname }] GROUP DETAIL</h4>
				</td>
			</tr>
			<tr>
				<th>GroupName(tot)</th>
				<td>${teamDetail.tname }(${teamMemberTotCnt }명)</td>
			</tr>
			<tr>
				<th>GroupCap.</th>
				<td>${teamDetail.mid }</td>
			</tr>
			<tr>
				<th>GroupMem.</th>
				<td>
					<c:forEach items="${teamMemberList }" var="tmList">
						<p>${tmList.mid }</p>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${empty tMemberDetail }">
						<button class="btn" 
							onclick="location.href='${conPath }/teammember/applyTeamMember.do?mid=${member.mid }&tno=${teamDetail.tno }'">[그룹가입 신청]</button>
					</c:if>
					<c:if test="${tMemberDetail.tmcheck eq 0 }">
						<button class="btn" 
							onclick="location.href='${conPath }/teammember/deleteApplyTeam.do?mid=${member.mid }&tno=${teamDetail.tno }'">[그룹가입 신청 철회]</button>
					</c:if>
					<c:if test="${not empty tMemberDetail and tMemberDetail.tmcheck eq 1 }">
						[가입 완료]
					</c:if>
				</td>
			</tr>
		</table>
	<script>
		$(document).ready(function(){
			//인덱스
			$('#teamboard').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
	</div>
</div>
</body>
</html>