<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		
		//태그등록
		$('#submit').click(function() {
			var hname = $('input[name=hname]').val();
			/*  document.getElementById('space') = tname;
			 let tcount; */
		
		/* 	 $.ajax({
				type : 'get', // 타입 (get, post, put 등등)
				url : 'review/testplus.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data : 'tname=' + tname,
				success : function(data) { // 결과 성공 콜백함수
					$('#space').html(data);
				},

			}) */ 
			 $.ajax({
				type : 'get', // 타입 (get, post, put 등등)
				url : 'review/testplus.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data : 'hname=' + hname,
				success : function(data) { // 결과 성공 콜백함수
					$('#space').append(data);
					
				},

			}) 
			
			
		});
		
	

	});
</script>
</head>
<body>

	<div id="hname">
		<input type="text" name="hname" id="hname">
	</div>
	<div id="space">
	
		<!-- <input type="hidden" name="space"> -->
	</div>
	<button id="submit">태그추가</button>
</body>
</html>