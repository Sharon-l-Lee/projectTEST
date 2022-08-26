
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
<link href="${conPath }/css/review/rcontent.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

		/* $('.modify').click(function() {
			//$(this).attr('id')
			//var rpnum = $('input[name=rpnum]').val();
			//var rnum = $('input[name=rnum]').val();
		//	var rpcontent = $('textarea[name=rpcontent]').text();
		//	console.log(rpnum + ',' + rnum +", " +rpcontent );
			$.ajax({
				type : 'post',
				url : '${conPath}/reply/modify.do',
				dataType : 'html',
				data :$("#mform").serialize(),
				success : function(data) {
					//location.reload();
					console.log(data);

				},

			})
		}); */

	});
</script>
</head>
<body>

	<form id="mform" action="${conPath}/reply/modify.do" method="post" class="r_modify">
		<input type="hidden" name="rpnum" value="${replymview.rpnum }">
		<input type="hidden" name="rnum" value="${replymview.rnum }">
		<textarea rows="10" cols="100" name="rpcontent" style="margin-top:10px;width:85%; height:70px;">${replymview.rpcontent }</textarea>
		<button id="${replymview.rpnum }" class="modify cbtn">수정</button>
	</form>

</body>
</html>