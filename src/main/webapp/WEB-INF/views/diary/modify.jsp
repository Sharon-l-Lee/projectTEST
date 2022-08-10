<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : 일기 수정하기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<form action="modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dnum" value="${diary.dnum }">
		<input type="hidden" name="ddate" value="${param.ddate }">
			<table>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="dtitle" value="${diary.dtitle }">
					</td>
				</tr>
				<tr>
					<th>투두리스트</th>
					<td>
						<input type="radio" name="dtodoin" value="0" 
							<c:if test="${diary.dtodoin eq 0 }">
								checked="checked"
							</c:if>
						>첨부안함
						<input type="radio" name="dtodoin" value="1" 
							<c:if test="${diary.dtodoin eq 1 }">
								checked="checked"
							</c:if>
						>첨부
					</td>
				</tr>
				<tr>
					<th>공개범위</th>
					<td>
						<input type="radio" name="dstatus" value="0" 
							<c:if test="${diary.dstatus eq 0 }">
								checked="checked"
							</c:if>
						>나만보기
						<input type="radio" name="dstatus" value="1"
							<c:if test="${diary.dstatus eq 1 }">
								checked="checked"
							</c:if>
						>친구공개
						<input type="radio" name="dstatus" value="2"
							<c:if test="${diary.dstatus eq 2 }">
								checked="checked"
							</c:if>
						>전체공개
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="dcontent" style="width: 100%; height:500px;">${diary.dcontent }</textarea>
						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>