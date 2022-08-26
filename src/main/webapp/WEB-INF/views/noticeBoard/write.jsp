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
	<link href="${conPath }/css/noticeboard/form.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#notice').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div class="write">
		<form action="${conPath }/notice/write.do" method="post">
			<input type="hidden" name="aid" value="${admin.aid }">
			
				<table>
					<caption><h2>Notice</h2></caption>
					<col style="width : 200px;">
					<col style="width : 600px;">
					<tr>
						<th>Title</th>
						<td class="sc"><input type="text" name="ntitle" class="ntitle" style="height : 30px;"></td>
					</tr>
					<tr>
						<th>Content</th>
						<td class="sc" style="height : 200px; padding : 10px;"><textarea name="ncontent" class="ncontent" rows="15" cols="10"></textarea></td>
					</tr>
				</table>
			
			<div class="btn_wrap">
				<input type="submit" value="등록" class="btn">
				<input type="reset" value="초기화" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/notice/list.do?pageNum=1'">
			</div>
		</form>
		</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>