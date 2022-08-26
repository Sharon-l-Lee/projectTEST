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
	<link href="${conPath }/css/team/myTeamModify.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function drawalTeamMember(tno, tmno){
			location.href = '${conPath}/teammember/drawalTeamMember.do?tno='+tno+'&tmno='+tmno;
		}
	</script>
</head>
<body>
<div class="wrap" style="background-image: url('../img/main_wraper.png');">
	<form action="${conPath }/team/myTeamModify.do" method="post">
		<input type="hidden" name="tno" value="${teamDetail.tno }">
		<table class="myTeamModify">
			<tr>
				<td class="teamModify_header">그룹 수정 사항</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="tname" value="${teamDetail.tname }" required="required"
						class="input" style="font-size: 1.3em; width: 130px;">
				</td>
			</tr>
			<tr>
				<td>
					<div class="selectBox">
					<select name="mid" class="select">
						<c:forEach var="list" items="${teamMemberList }">
							<option value="${list.mid }" 
								<c:if test ="${teamDetail.mid eq list.mid }">selected="selected"</c:if>>${list.mname }(${list.mid })
							</option>
						</c:forEach>
					</select>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="tgoal" value="${teamDetail.tgoal }" class="input" style="width: 300px;"></td>
			</tr>
			<tr>
				<td>
					<table class="teamMList_wrap">
						<tr>
							<td class="teamMList_header">
								그룹원 리스트
							</td>
						</tr>
						<tr>
							<td style="border:2px solid black; border-radius: 0 0 15px 15px; height: 100px;">
							<c:forEach items="${teamMemberList }" var="list">
				  				<table class="teamMList_main">
									<tr>
						  				<td>${list.mname }(${list.mid })</td>
						  				<td>
							  				<c:if test="${teamDetail.mid ne list.mid }">
								  				<button onclick="drawalTeamMember(${teamDetail.tno}, ${list.tmno })" class="teamMList_btn">
								  					[그룹탈퇴처리]
								  				</button>
							  				</c:if>
						  				</td>
									</tr>
								</table>
							</c:forEach>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="btn">
					<input type="submit" value="[그룹수정]" class="btn">
					<input type="button" value="[그룹삭제]" onclick="location.href='${conPath}/team/teamDelete.do?tno=${teamDetail.tno }'" class="btn">
				</td>
			</tr>
		</table>
	</form>
	<script>
		$(document).ready(function(){
			//인덱스
			$('#group').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
</div>
</body>
</html>