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
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div>
		<form action="${conPath }/notice/update.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="nno" value="${notice.nno }">
			<div class="write">
				<table>
					<col style="width: 200px;">
					<col style="width: 600px;">
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="ntitle" class="ntitle" value="${notice.ntitle }">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="height: 200px; padding: 10px;">
							<textarea name="ncontent" class="ncontent" rows="15" cols="10">${notice.ncontent }</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="submit" value="수정" class="btn">
				<input type="reset" value="초기화" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/notice/list.do?pageNum=${param.pageNum }'">
			</div>
		</form>
	</div>
</body>
</html>