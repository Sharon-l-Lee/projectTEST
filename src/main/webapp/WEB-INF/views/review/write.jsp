
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
		//태그 추가
		   $(document).ready(function () {
            let tname = document.getElementById('tname').value();
            document.getElementById('space') = tname;
            let tcount;


        });
	</script>
</head>
<body>
	<form action="write.do" enctype="multipart/form-data" method="post">
		<div>
			<input type="text" name="mid">
		</div>
		<div>
			<input type="text" name="rtitle">
		</div>
		<div>
			<textarea rows="5" cols="10" name="rcontent"></textarea>
		</div>
		<div>
			<input type="file" name="tempfile">
		</div>
		<div>
			<input type="Date" name="rrdate" >
		</div>
		<div>
			<input type="radio" name="rstatus" value="0"> 전체공개
			<input type="radio" name="rstatus" value="1"> 친구공개
			<input type="radio" name="rstatus" value="2"> 나만보기
		</div>
		<div id="tname"><input type="text" name="tname"></div>
		<div id="space"><input type="hidden" name="space"></div>
		<div>
			<input type="submit" value="제출">
		</div>
		
	</form>
</body>
</html>