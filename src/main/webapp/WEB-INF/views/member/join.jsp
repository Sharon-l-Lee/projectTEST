<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('form').submit(function(){
			var idCheckResult = $('#idCheckResult').text().trim();
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (idCheckResult != '사용가능한 아이디입니다') {
				alert('사용 가능한 ID로 입력하세요');
				return false;
			} else if (mpwChk != mpw) {
				alert('비밀번호를 확인하세요');
				return false;
			} 
		});
	});

	function idCheck(mid) {
		var mid = $('#mid').val();
		$.ajax({
			url : '${conPath}/idCheck.do',
			data : 'mid=' + mid,
			type : 'get',
			dataType : 'html',
			success : function(data, status) {
				$('#idCheckResult').html(data);
			}
		});
	}
</script>

</head>
<body>
	<div>
		<form action="${conPath }/join.do" method="post">
			<table>
				<caption>회원가입</caption>
				<tr>
					<th><label for="mid">아이디</label></th>
					<td><input type="text" name="mid" id="mid"> <input
						type="button" value="중복확인" class="btn" onclick="idCheck(mid)">
						<div id="idCheckResult"></div></td>
				</tr>
				<tr>
					<th><label for="mpw">비밀번호</label></th>
					<td><input type="password" name="mpw" id="mpw"></td>
				</tr>
				<tr>
					<th><label for="mpwChk">비밀번호</label></th>
					<td><input type="password" name="mpwChk" id="mpwChk">
					</td>
				</tr>
				<tr>
					<th><label for="mname">닉네임</label></th>
					<td><input type="text" name="mname" id="mname"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="tempmbirth"
						class="datepicker"></td>
				</tr>
				<tr>
					<th><label for="memail">이메일</label></th>
					<td><input type="email" name="memail" id="memail"></td>
				</tr>
				<tr>
					<th>좌우명</th>
					<td><textarea rows="5" cols="10" name="mmotto"></textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="가입하기" class="btn">
			</div>
		</form>
	</div>
</body>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
  	$(function() {
    	$('.datepicker').datepicker({
    		dateFormat : 'yy-mm-dd',
    		changeMonth : true,
    		monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		showMonthAfterYear : true,
        	yearSuffix : '년',
        	showOtherMonths : true,
        	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true,
			minDate : '-100y',
			maxDate : 'y',
			yearRange : 'c-100:c+100'
    	});
  	});
</script>
</html>