<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function replyComment(tcnum, pageNum, tnum) {
			$('#show').click(function(){
				$('#replyDiv').show();
			});
			$('#hide').click(function(){
				$('#commentReplyForm').hide();
			});
		}
	</script>
</head>
<body>
	<form id="commentReplyForm" action="${conPath }/teamcomment/reply.do" method="post">
		<input type="hidden" name="tnum" value="${param.tnum }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="tcpageNum" value="${param.tcpageNum }">
		<input type="hidden" name="tcgroup" value="${teamcomment.tcgroup }">
		<input type="hidden" name="tcstep" value="${teamcomment.tcstep }"> 
		<input type="hidden" name="tcindent" value="${teamcomment.tcindent }">
		<table>
			<tr>
				<th><input type="text" name="mid" required="required">
					<%-- ${param.mid } --%></th>
				<td><input type="text" name="tccontent" required="required"></td>
				<td><input type="submit" value="답댓글쓰기" class="btn"></td>
				<td><input id="hide" type="reset" value="취소" class="btn"></td>
			</tr>
		</table>
	</form>
</body>
</html>