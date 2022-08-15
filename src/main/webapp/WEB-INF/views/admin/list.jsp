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
<link href="${conPath}/css/adminlist.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<c:if test="${adminDelete eq 0}">
		<script>
			alert('관리자 삭제에 실패했습니다');
		</script>
	</c:if>
	<c:if test="${adminDelete eq 1}">
		<script>
			alert('관리자가 삭제되었습니다');
		</script>
	</c:if>
	
	<div id="main_wrap">
		<div id="wrap">

			<h2>관리자 리스트</h2>
			<div id="list" >
					<c:if test="${admin.agrade eq 1 }">

						<button onclick="window.open('${conPath}/admin/join.do', '_blank','width=600,height=400')">관리자 등록</button>
					</c:if>
					<table>
						<tr>
							<th>아이디</th>
							<th>등급</th>
							<th>관리자삭제</th>
						</tr>
						<c:forEach var="ad" items="${adminList }">
							<tr>

								<td>${ad.aid }</td>
								<td>${ad.agrade }</td>
								<c:if test="${admin.agrade eq 1 }">
									<td><button
											onclick="location.href='${conPath}/admin/delete.do?aid=${ad.aid}'">관리자
											삭제</button></td>
								</c:if>
								<c:if test="${admin.agrade eq 0 }">
									<td>권한이 없습니다</td>
								</c:if>

							</tr>
						</c:forEach>

					</table>
				</div>

				

				</div>
			</div>
</body>
</html>