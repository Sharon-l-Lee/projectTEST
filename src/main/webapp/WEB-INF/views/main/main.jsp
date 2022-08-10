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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>메인입니다</h1>
	<c:if test="${joinResult eq 0 }">
		<script>
			alert('회원가입 실패');
		</script>
	</c:if>
	<c:if test="${joinResult eq 1 }">
		<script>
			alert('회원가입 성공');
		</script>
	</c:if>
	<c:if test="${modifyResult eq 0 }">
		<script>
			alert('회원정보수정 실패');
		</script>
	</c:if>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('회원정보수정 성공');
		</script>
	</c:if>
	<c:if test="${loginResult eq '관리자 로그인 실패' or loginResult eq '유효하지 않은 아이디입니다' or loginResult eq '비밀번호가 맞지 않습니다'}">
		<script>
			alert('${loginResult}');
			history.back();
		</script>
	</c:if>
	<c:if test="${loginResult eq '관리자 로그인 성공' }">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<c:if test="${logoutResult eq '관리자 로그아웃 실패'}">
		<script>
			alert('${logoutResult}');
			history.back();
		</script>
	</c:if>
	<c:if test="${logoutResult eq '관리자 로그아웃 성공' }">
		<script>
			alert('${logoutResult}');
		</script>
	</c:if>
	<h1>메인입니다</h1>
	<c:if test="${not empty admin }">
		<button onclick="location.href='${conPath }/admin/logout.do'">관리자 로그아웃</button>
	</c:if>
</body>
</html>