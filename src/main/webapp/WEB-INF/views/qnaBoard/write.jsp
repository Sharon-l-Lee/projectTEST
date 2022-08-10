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
	<div>
		<form action="${conPath }/qna/write.do" method="post">
			<input type="hidden" name="mid" value="${member.mid }">
			<div class="write">
				<table>
					<col style="width : 200px;">
					<col style="width : 600px;">
					<tr>
						<th>제목</th>
						<td><input type="text" name="qtitle" class="qtitle"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="qwriter" class="qwriter"
							value="${member.mname }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="padding : 10px;"><textarea name="qcontent" class="qcontent" rows="10" cols="10"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="submit" value="등록" class="btn">
				<input type="reset" value="초기화" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/qna/list.do?pageNum=1'">
			</div>
		</form>
	</div>
</body>
</html>