<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script>
		$(document).ready(function(){
			$('.unfollow').click(function() {
				var id = $(this).attr('id');
				var answer = confirm('정말 해당 친구를 언팔로우하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/friend/unfollow.do?alcode=2&fid=' + id;
				} else {
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<table>
		<c:if test="${empty friends }">
			<tr>
				<td>등록된 친구가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty friends }">
			<c:forEach items="${friends }" var="f">
				<tr>
					<td>${f.mname }(${f.fid })</td>
					<td><button id="${f.fid }" class="unfollow">unfollow</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>