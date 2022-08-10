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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function (){
			
		}
	</script>
</head>
<body>
	<form action="${conPath }/teamcomment/modify.do" method="post" >
		<input type="hidden" name="tnum" value="${param.tnum }">
		<input type="hidden" name="tcnum" value="${teamcomment.tcnum }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="tcpageNum" value="${param.tcpageNum }">
		<table>
			<caption>${teamcomment.tcnum }번 댓글 수정</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mid" value="${teamcomment.mid }"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="5" name="tccontent">${teamcomment.tccontent }</textarea> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장" class="btn">
					<input type="reset" value="취소" class="btn" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>