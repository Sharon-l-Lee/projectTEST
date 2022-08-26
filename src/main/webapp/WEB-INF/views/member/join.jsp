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
<link href="${conPath }/css/member/info.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('form').submit(function(){
			var idCheckResult = $('#idCheckResult').text().trim();
			var emailCheckResult = $('#emailCheckResult').text().trim();
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (idCheckResult != '사용가능한 아이디입니다') {
				alert('사용 가능한 ID로 입력하세요');
				return false;
			} else if (emailCheckResult != '사용가능한 이메일입니다') {
				alert('사용 가능한 이메일로 입력하세요');
				return false;
			} else if (mpwChk != mpw) {
				alert('비밀번호가 일치하지 않습니다');
				return false;
			} 
		});
		
		$('#join').addClass('nowIndex');
	});

	function idCheck(mid) {
		var mid = $('#mid').val();
		$.ajax({
			url : '${conPath}/member/idCheck.do',
			data : 'mid=' + mid,
			type : 'get',
			dataType : 'html',
			success : function(data, status) {
				$('#idCheckResult').html(data);
			}
		});
	}
	
	function emailCheck(memail) {
		var memail = $('#memail').val();
		$.ajax({
			url : '${conPath}/member/emailCheck.do',
			data : 'memail=' + memail,
			type : 'get',
			dataType : 'html',
			success : function(data, status) {
				$('#emailCheckResult').html(data);
			}
		});
	}
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
		<div id="info">
		<form action="${conPath }/member/join.do" method="post">
			<table>
				<caption><h2>Join Member</h2></caption>
				<tr>
					<td>
						<input type="text" name="mid" id="mid" placeholder="ID"> 
						<input type="button" value="중복확인" class="btn" onclick="idCheck(mid)">
					</td>
				</tr>
				<tr>
					<td><div id="idCheckResult"></div></td>
				</tr>
				<tr>
					<td><input type="password" name="mpw" id="mpw" placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td><input type="password" name="mpwChk" id="mpwChk" placeholder="PASSWORD CHECK">
					</td>
				</tr>
				<tr>
					<td><input type="text" name="mname" id="mname" placeholder="NICKNAME"></td>
				</tr>
				<tr>
					<td><input type="text" name="tempmbirth"
						class="datepicker" id="tempmbirth" placeholder="BIRTHDAY"></td>
				</tr>
				<tr>
					<td>
						<input type="email" name="memail" id="memail" placeholder="EMAIL">
						<input type="button" value="중복확인" class="btn" onclick="emailCheck(memail)">
					</td>
				</tr>
				<tr><td><div id="emailCheckResult"></div></td></tr>
				<tr>
					<td><textarea rows="2" cols="20" name="mmotto" class="mmotto" placeholder="MOTTO"></textarea></td>
				</tr>
				<tr>
					<th style="height : 50px; padding-top : 20px;"><input type="submit" value="가입하기" class="btn"></th>
				</tr>
			</table>
		</form>
		</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
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