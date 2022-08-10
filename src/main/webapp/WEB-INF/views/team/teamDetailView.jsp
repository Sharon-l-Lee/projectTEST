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
<link href="${conPath}/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
		function (){
			
		}
	</script>
</head>
<body>
	<div id="content">
		<table>
			<caption>${teamDetail.tname }그룹상세보기</caption>
			<tr>
				<th>그룹명(인원)</th>
				<th>그룹 팀장</th>
				<th>그룹 조원</th>
			</tr>
			<tr>
				<td>${teamDetail.tname }(${teamMemberTotCnt }명)</td>
				<td>${teamDetail.mid }</td>
				<td>
					<table>
						<c:forEach items="${teamMemberList }" var="tmList">
							<tr>
								<td>${tmList.mid }</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>