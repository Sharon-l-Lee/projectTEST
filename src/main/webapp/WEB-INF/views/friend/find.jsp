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
	<link href="${conPath }/css/friend/findFriend.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[name="mname"]').keyup(function(){
				var mname = $('input[name="mname"]').val();
				$.ajax({
					url : '${conPath}/member/find.do',
					data : 'mname=' + mname,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#findResult').html(data);
					}
				});
			});
			$('#friend').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="findList">
				<form>
					<input type="text" name="mname" placeholder="닉네임 또는 아이디를 입력하세요">
				</form>
			<div id="findResult"></div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>