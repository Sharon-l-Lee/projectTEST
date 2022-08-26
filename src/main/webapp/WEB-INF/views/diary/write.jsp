<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : write</title>
	<link href="${conPath }/css/diary/writeform.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>
	<script>
		$(function() {
			CKEDITOR.replace('dcontent', {
				filebrowserUploadUrl : '${conPath }/ckeditor/diaryUpload.do'
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			//인덱스
			$('#myList').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<form action="write.do" method="post" enctype="multipart/form-data" id="form">
			<input type="hidden" name="ddate" value="${param.ddate }">
				<div id="dtitle">
					<p class="span_title">제목</p>
					<p>
						<input type="text" name="dtitle">
					</p>
				</div>
				<div id="dtodoin">
					<p class="span_title">투두리스트</p>
					<p>
						<span class="radio"><input type="radio" name="dtodoin" value="0" checked="checked">첨부안함</span>
						<span class="radio"><input type="radio" name="dtodoin" value="1">첨부</span>
					</p>
				</div>
				<div id="dstatus">
					<p class="span_title">공개범위</p>
					<p>
						<span class="radio">
							<input type="radio" name="dstatus" value="0" checked="checked">나만보기
						</span>
						<span class="radio">
							<input type="radio" name="dstatus" value="1">친구공개
						</span>
						<span class="radio">
							<input type="radio" name="dstatus" value="2">전체공개
						</span>
					</p>
				</div>
				<div class="content_title">내용</div>
				<div id="content">
					<textarea id="classic" name="dcontent" required="required"></textarea>
				</div>
				<div id="button">
					<input type="submit" value="작성">
					<input type="button" onclick="history.back()" value="목록">
				</div>
			</form>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>