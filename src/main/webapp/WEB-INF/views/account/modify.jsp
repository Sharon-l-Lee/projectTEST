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
	<form action="${conPath }/account/modify.do" method="post" id="form">
		<input type="hidden" name="ano" value="${account.ano }">
		<div id="table">
			<div id="table_title">ACCOUNT BOOK MODIFY</div>
			<div id="content">
				<span class="title">내용</span>
				<input type="text" id="acontent" name="acontent" value="${account.acontent }"  required="required">
			</div>
			<div id="aprice">
				<span class="title">금액</span>
				<input type="number" id="aprice" name="aprice" value="${account.aprice }" min="0">원
			</div>
			<div id="astatus">
				<input type="radio" name="astatus" value="0" 
					<c:if test="${account.astatus eq 0 }">
						checked="checked"
					</c:if>
					>지출
					<input type="radio" name="astatus" value="1"
					<c:if test="${account.astatus eq 1 }">
						checked="checked"
					</c:if>
					>수입
			</div>
			<div id="category">
				<span class="title">카테고리</span>
				<select name="acno" required="required">
					<c:forEach var="category" items="${categoryList }">
						<option value="${category.acno }" 
						<c:if test="${category.acno eq account.acno }">
							selected="selected"
						</c:if>
						>${category.atitle }</option>
					</c:forEach>
				</select>
			</div>
			<div id="date">
				<span class="title">날짜</span>
				<input type="text" name="adate_temp" id="datepicker" value="<fmt:formatDate value="${account.adate }" pattern="yyyy-MM-dd"/>">
				<select name="hour" required="required">
					<c:forEach var="i" begin="0" end="23">
						<option 
						<c:if test="${account.adate.getHours() eq i }">
						selected="selected"
						</c:if>
						>${i }</option>
					</c:forEach>
				</select>시
				<select name="minutes" required="required">
					<c:forEach var="i" begin="0" end="59">
						<option
						<c:if test="${account.adate.getMinutes() eq i }">
						selected="selected"
						</c:if>
						>${i }</option>
					</c:forEach>
				</select>분
			</div>
			<div id="button">
				<input type="submit" value="수정">
			</div>
		</div>
	</form>
</body>
</html>