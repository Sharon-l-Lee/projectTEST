
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
<link href="${conPath }/css/rwrite.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>


<script>
	$(document).ready(function() {
		
		//ck에디터
		$(function() {
			CKEDITOR.replace('rcontent', {
				filebrowserUploadUrl : '${conPath }/ckeditor/reviewUpload.do'
				
			});
		});

		//배열
		//var hnames=[];
		//태그등록
		$('#submit').click(function() {
			var hname = $('input[name=hname]').val();

			$.ajax({
				type : 'get', // 타입 (get, post, put 등등)
				url : '${conPath}/hashtag/testplus.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data : 'hname=' + hname,
				success : function(data) { // 결과 성공 콜백함수
					/* 	$('#space').append(data);
						var temp = data.trim();
						var idx = temp.indexOf('#');
						var lastIdx = temp.indexOf('</span>');
						var hn = temp.substring(idx+1, lastIdx);
						hnames.push(hn); */

				},

			})

		});
		
		//태그 key up
		
		$('.hname').keydown(function(e){
			let tag = $('input[name=hname]').val();
			if(e.keyCode==32){
				$('#space').text('#'+tag);
			
			}
		});
	
	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<h1>REVIEW WRITE</h1>
			<div id="content_wrap">
				<form action="write.do" enctype="multipart/form-data" method="post"
					id="write">

					<div class="ipt">
						TITLE <input type="text" name="rtitle" class="rtitle">
					</div>
					<div class="ipt">
						CONTENT <textarea rows="5" cols="10" name="rcontent" id="editor"></textarea>
					</div>
					<div class="ipt">
						FILE<input type="file" name="tempfile" class="file">
					</div>
				
					<div class="ipt"> RANGE
						<input type="radio" name="rstatus" value="0" class="range"> 전체공개 
						<input type="radio" name="rstatus" value="1" class="range"> 친구공개 
						<input type="radio" name="rstatus" value="2" class="range"> 나만보기
					</div>

					<div id="hname" class="ipt">
						TAG<input type="text" name="hname" class="hname" placeholder="space로 태그 구분해서 추가 ex)헌트 영화 재미 ">
					</div>
					<div>
						<input type="submit" value="글쓰기" id="formsubmit" class="ipt_btn">
						<button class="ipt_btn" onclick="history.back()">뒤로가기</button>
					</div>

				</form>

				<div id="space" class="tarea"></div>

			</diV>
		</div>
	</div>
</body>
</html>