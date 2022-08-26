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
	<link href="${conPath }/css/member/info.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('form').submit(function(){
				var currpw = '${myInfo.mpw}';
				var oldpw = $('#oldpw').val();
				var mpw = $('#mpw').val();
				var mpwChk = $('#mpwChk').val();
				if (mpw == null && mpwChk == null) {
					mpw = oldpw;
					mpwChk = oldpw;
				}
				if (oldpw == '') {
					alert('현재 비밀번호를 입력하세요');
					return false;
				} else {
					if (mpwChk != mpw) {
						alert('새비밀번호가 일치하지 않습니다');
						$('#mpw').focus();
						return false;
					} else if (currpw != oldpw) {
						alert('현재비밀번호가 일치하지 않습니다');
						$('#oldpw').focus();
						return false;
					}
				}
				
			});
			
			$('input[name="outMember"]').click(function(){
				var id = $(this).attr('id');
				var answer = confirm('정말 회원탈퇴하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/member/outMember.do?mid=' + id;
				} else {
					return false;
				}
			});
			
			$('#mypage').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="info">
				<form action="${conPath }/member/modify.do" method="post">
					<input type="hidden" name="mid" value="${myInfo.mid }">
					<input type="hidden" name="memail" value="${myInfo.memail }">
					<table>
						<caption><h2>Modify My Info</h2></caption>
						<tr>
							<th><label for="mid">ID</label></th>
							<td>${myInfo.mid }</td>
						</tr>
						<tr>
							<th>
								<label for="oldpw">Old Password</label>
							</th>
							<td>
								<input type="password" name="oldpw" id="oldpw">
							</td>
						</tr>
						<tr>
							<th>
								<label for="mpw">New Password</label>
							</th>
							<td>
								<input type="password" name="mpw" id="mpw">
							</td>
						</tr>
						<tr>
							<th>
								<label for="mpwChk">Password Check</label>
							</th>
							<td>
								<input type="password" name="mpwChk" id="mpwChk">
							</td>
						</tr>
						<tr>
							<th>
								<label for="mname">Nickname</label>
							</th>
							<td>
								<input type="text" name="mname" id="mname" value="${myInfo.mname }">
							</td>
						</tr>
						<tr>
							<th>Birthday</th>
							<td>
								<input type="text" name="tempmbirth" class="datepicker" id="tempmbirth" value="${myInfo.mbirth }">
							</td>
						</tr>
						<tr>
							<th><label for="memail">Email</label></th>
							<td>${myInfo.memail }</td>
						</tr>
						<tr>
							<th>Motto</th>
							<td>
								<textarea rows="5" cols="10" name="mmotto" class="mmotto">${myInfo.mmotto }</textarea>
							</td>
						</tr>
					</table>
					<div class="btn_wrap">
						<input type="submit" value="정보수정" class="btn">
						<input type="button" value="취소" class="btn" onclick="location.href='../main.do'">
						<input type="button" value="회원탈퇴" id="${myInfo.mid }" class="btn" name="outMember">
					</div>
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