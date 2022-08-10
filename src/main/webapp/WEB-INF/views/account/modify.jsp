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
	<form action="${conPath }/account/modify.do" method="post" id="modify_form">
		<input type="hidden" name="ano" value="${account.ano }">
		<table>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="acontent" value="${account.acontent }" required="required">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="aprice" value="${account.aprice }" min="0">
				</td>
			</tr>
			<tr>
				<td colspan="2">
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
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="acno" required="required">
						<c:forEach var="category" items="${categoryList }">
							<option value="${category.acno }" 
							<c:if test="${category.acno eq account.acno }">
								selected="selected"
							</c:if>
							>${category.atitle }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>
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
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>