
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<form action="modify.do" enctype="multipart/form-data" method="post">
		<div>
			<input type="hidden" name="mid" value="${modifyView.mid }">
			<input type="hidden" name="rnum" value="${modifyView.rnum }">
		</div>
		<div>
			<input type="text" name="rtitle" value="${modifyView.rtitle }">
		</div>
		<div>
			<textarea rows="5" cols="10" name="rcontent">${modifyView.rcontent }</textarea>
		</div>
		<div>
			<input type="file" name="tempfile" value="${modifyView.rfilename }">
		</div>
		<div>
			<input type="Date" name="rrdate" value="${modifyView.rrdate }">
		</div>
		<c:if test="${modifyView.rstatus eq 0 }">
			<div>
				<input type="radio" name="rstatus" value="0" checked="checked"> 전체공개
				<input type="radio" name="rstatus" value="1"> 친구공개
				<input type="radio" name="rstatus" value="2"> 나만보기
			</div>
		</c:if>
		<c:if test="${modifyView.rstatus eq 1 }">
			<div>
				<input type="radio" name="rstatus" value="0"> 전체공개
				<input type="radio" name="rstatus" value="1" checked="checked"> 친구공개
				<input type="radio" name="rstatus" value="2"> 나만보기
			</div>
		</c:if>
		<c:if test="${modifyView.rstatus eq 2 }">
			<div>
				<input type="radio" name="rstatus" value="0"> 전체공개
				<input type="radio" name="rstatus" value="1"> 친구공개
				<input type="radio" name="rstatus" value="2" checked="checked"> 나만보기
			</div>
		</c:if>
		<div>
			<input type="submit" value="제출">
		</div>
	</form>
</body>
</html>