
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/review/rwrite.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function() {
		//인덱스
		$('#review').addClass('nowIndex');

		//ck에디터
		$(function() {
			CKEDITOR.replace('rcontent', {
				filebrowserUploadUrl : '${conPath }/ckeditor/reviewUpload.do'

			});
		});

	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<h1>REVIEW MODIFY</h1>
			<div id="content_wrap">
				<form action="modify.do" enctype="multipart/form-data" method="post">
					<div class="ipt">
						<input type="hidden" name="mid" value="${modifyView.mid }">
						<input type="hidden" name="rnum" value="${modifyView.rnum }">
					</div>
					<div class="ipt">
						<input type="text" class="rtitle" name="rtitle" value="${modifyView.rtitle }">
					</div>
					<div class="ipt">
						<textarea rows="5" cols="10" name="rcontent" id="editor">${modifyView.rcontent }</textarea>
					</div>
					 <div class="ipt">
						<input type="file" name="tempfile" class="file"
							value="${modifyView.rfilename }">
					</div> 
					<c:if test="${modifyView.rstatus eq 0 }">

						<div class="ipt">
							RANGE <input type="radio" name="rstatus" value="0" class="range"
								checked="checked"> 전체공개 <input type="radio"
								name="rstatus" value="1" class="range"> 친구공개 <input
								type="radio" name="rstatus" value="2" class="range">
							나만보기
						</div>

					</c:if>
					<c:if test="${modifyView.rstatus eq 1 }">
						<div class="ipt">
							RANGE <input type="radio" name="rstatus" value="0" class="range">
							전체공개 <input type="radio" name="rstatus" value="1" class="range"
								checked="checked"> 친구공개 <input type="radio"
								name="rstatus" value="2" class="range"> 나만보기
						</div>
					</c:if>
					<c:if test="${modifyView.rstatus eq 2 }">
						<div class="ipt">
							RANGE <input type="radio" name="rstatus" value="0" class="range">
							전체공개 <input type="radio" name="rstatus" value="1" class="range">
							친구공개 <input type="radio" name="rstatus" value="2" class="range"
								checked="checked"> 나만보기
						</div>
					</c:if>
					<div>
						<input type="submit" value="제출" class="ipt_btn">
						<button class="ipt_btn" onclick="history.back()">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>

</body>
</html>