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
	<link href="${conPath }/css/diary/writeform.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
			<form action="modify.do" method="post" enctype="multipart/form-data" id="form">
			<input type="hidden" name="dnum" value="${diary.dnum }">
			<input type="hidden" name="ddate" value="${diary.ddate }">
			<input type="hidden" name="returnInt" value="${returnInt }">
				<div id="dtitle">
					<p class="span_title">제목</p>
					<p>
						<input type="text" name="dtitle" value="${diary.dtitle }">
					</p>
				</div>
				<div id="dtodoin">
					<p class="span_title">투두리스트</p>
					<p>
						<span class="radio">
							<input type="radio" name="dtodoin" value="0" 
								<c:if test="${diary.dtodoin eq 0 }">
									checked="checked"
								</c:if>
							>첨부안함
						</span>
						<span class="radio">
							<input type="radio" name="dtodoin" value="1" 
								<c:if test="${diary.dtodoin eq 1 }">
									checked="checked"
								</c:if>
							>첨부
						</span>
					</p>
				</div>
				<div id="dstatus">
					<p class="span_title">공개범위</p>
					<p>
						<span class="radio">
							<input type="radio" name="dstatus" value="0" 
								<c:if test="${diary.dstatus eq 0 }">
									checked="checked"
								</c:if>
							>나만보기
						</span>
						<span class="radio">
							<input type="radio" name="dstatus" value="1"
								<c:if test="${diary.dstatus eq 1 }">
									checked="checked"
								</c:if>
							>친구공개
						</span>
						<span class="radio">
							<input type="radio" name="dstatus" value="2"
								<c:if test="${diary.dstatus eq 2 }">
									checked="checked"
								</c:if>
							>전체공개
						</span>
					</p>
				</div>
				<div class="content_title">내용</div>
				<div id="content">
					<textarea id="classic" name="dcontent" required="required">${diary.dcontent }</textarea>
				</div>
				<div id="button">
					<input type="submit" value="저장">
					<input type="button" onclick="history.back()" value="목록">
				</div>
			</form>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>