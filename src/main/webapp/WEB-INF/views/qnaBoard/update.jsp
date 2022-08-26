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
<link href="${conPath }/css/qnaboard/form.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#qna').addClass('nowIndex');
	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<form action="${conPath }/qna/update.do" method="post">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="qno" value="${qna.qno }">
				<div class="write">
					<table>
						<caption>
							<h2>Q&A 수정</h2>
						</caption>
						<col style="width: 200px;">
						<col style="width: 600px;">
						<tr>
							<th>Title</th>
							<td class="sc" height="10"><input type="text" name="qtitle" class="qtitle"
								value="${qna.qtitle }"></td>
						</tr>
						<tr>
							<th>Writer</tH>
							<td class="sc" height="10"><input type="text" name="qwriter" class="qwriter"
								value="${qna.qwriter }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>Content</th>
							<td class="sc"><textarea name="qcontent" class="qcontent" rows="10"
									cols="10">${qna.qcontent }</textarea></td>
						</tr>
					</table>
					<div class="btn_wrap">
						<input type="submit" value="수정" class="btn"> <input
							type="reset" value="초기화" class="btn"> <input
							type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
					</div>
				</div>
			</form>
			<div id="sub_nav">
				<ul>
					<c:if test="${member != null }">
					<li><a href="${conPath }/qna/list.do?pageNum=1">Q&A목록</a></li>
					<li><a href="${conPath }/qna/writeView.do">Q&A작성</a></li>
					<li><a href="${conPath }/qna/myList.do">My Q&A List</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>