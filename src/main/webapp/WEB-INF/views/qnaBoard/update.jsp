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
			
		});
	</script>
</head>
<body>
	<form action="${conPath }/qna/update.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="qno" value="${qna.qno }">
			<div class="write">
				<table>
					<col style="width : 200px;">
					<col style="width : 500px;">
					<tr>
						<th>제목</th>
						<td><input type="text" name="qtitle" class="qtitle" value="${qna.qtitle }"></td>
					</tr>
					<tr>
						<th>작성자</tH>
						<td><input type="text" name="qwriter" class="qwriter"
							value="${qna.qwriter }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="qcontent" class="qcontent" rows="10" cols="10">${qna.qcontent }</textarea></td>
					</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="submit" value="수정" class="btn">
				<input type="reset" value="초기화" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
			</div>
		</form>
</body>
</html>