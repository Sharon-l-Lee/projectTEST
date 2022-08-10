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
		});
	</script>
</head>
<body>
	<div>
		<form>
			<p>친구검색 <input type="text" name="mname" placeholder="닉네임을 입력하세요"></p>
		</form>
		<div id="findResult"></div>
	</div>
</body>
</html>