<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Account Modify</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${conPath }/css/account/form.css" rel="stylesheet">
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<script>
	  $( function() {
	    $( "#datepicker" ).datepicker({
	    	dateFormat : 'yy-mm-dd',
	      	monthNames : ['1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    	dayNamesMin:['일','월','화','수','목','금','토'],
	      	yearSuffix : '년',
	    	showOtherMonths : true,
	    	selectOtherMonths: true
	    });
	  });
  	</script>
</head>
<body>
	<form action="${conPath }/account/write.do" method="post" id="form">
		<div id="table">
			<div id="table_title">ACCOUNT BOOK WRITE</div>
			<div id="content">
				<span class="title">내용</span>
				<input type="text" id="acontent" name="acontent"  required="required">
			</div>
			<div id="aprice">
				<span class="title">금액</span>
				<input type="number" id="aprice" name="aprice" min="0">원
			</div>
			<div id="astatus">
				<input type="radio" name="astatus" value="0" checked="checked">지출
				<input type="radio" name="astatus" value="1">수입
			</div>
			<div id="category">
				<span class="title">카테고리</span>
				<select name="acno" required="required">
					<c:forEach var="category" items="${categoryList }">
						<option value="${category.acno }">${category.atitle }</option>
					</c:forEach>
				</select>
			</div>
			<div id="date">
				<span class="title">날짜</span>
				<input type="text" name="adate_temp" id="datepicker" value="${nowDate }">
				<select name="hour">
					<c:forEach var="i" begin="0" end="23">
						<option>${i }</option>
					</c:forEach>
				</select>시
				<select name="minutes">
					<c:forEach var="i" begin="0" end="59">
						<option>${i }</option>
					</c:forEach>
				</select>분
			</div>
			<div id="button">
				<input type="submit" value="작성">
			</div>
		</div>
	</form>
</body>
</html>