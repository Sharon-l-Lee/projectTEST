<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var tname= '${tname}';
	
	var blank = document.createTextNode("\u00a0\u00a0\u00a0\u00a0");
	$('#tag').append('<span>'+tname+'</span>');
	$('#tag').append('<button id="delete">X</button>');
	//$('#tag').append('<button onclick="location.href=''">X</button>');
	$('#tag').append(blank);
	
</script>
</head>
<body>
<span id="tag">
		<!-- <input type="hidden" name="space"> -->
	</span>
</body>
</html>