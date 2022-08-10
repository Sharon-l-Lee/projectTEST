<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/teamboard/reply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="tgroup" value="${teamboard.tgroup }">
		<input type="hidden" name="tstep" value="${teamboard.tstep }">
		<input type="hidden" name="tindent" value="${teamboard.tindent }">
		<table>
			<caption>답글쓰기</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mid" required="required"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ttitle" required="required"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="20" name="tcontent"></textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="tempTfilename"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location.href='${conPath}/teamboard/list.do?pageNum=${param.pageNum }'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>