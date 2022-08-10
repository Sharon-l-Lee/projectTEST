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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#search').click(function() {
				var searchIdPw = open('${conPath}/member/searchIdPwView.do', '',
									'width=800, height=500, left=800, top=300');
				if (!searchIdPw) {
					alert('팝업차단 설정이 되어있습니다. 차단 해제 이후 다시 시도하세요.');
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${joinResult eq 0 }">
		<script>
			alert('회원가입 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${joinResult eq 1 }">
		<script>
			alert('회원가입 성공');
		</script>
	</c:if>
	<c:if test="${loginResult != null }">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<div>
		<form action="${conPath }/member/login.do" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" value="${mid}"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" value="${mpw}"></td>
				</tr>
			</table>
			<p>
				<input type="submit" value="로그인" class="btn">
			</p>
			<p>
				<span id="search">아이디/비밀번호 찾기</span>
			</p>
		</form>
	</div>
</body>
</html>