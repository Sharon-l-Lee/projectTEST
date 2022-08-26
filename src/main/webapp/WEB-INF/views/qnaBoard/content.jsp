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
	<link href="${conPath }/css/qnaboard/content.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#qna').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<c:if test="${updateResult eq 0 }">
		<script>
			alert('수정 실패');
		</script>
	</c:if>
	<c:if test="${updateResult eq 1 }">
		<script>
			alert('질문이 수정되었습니다');
		</script>
	</c:if>
	<div id="main_wrap">
		<div id="wrap">
			<div id="content">
				<table>
					<caption><h2>Q&A</h2></caption>
					<col style="width : 200px;">
					<col style="width : 600px;">
					<tr>
						<th>Title</th>
						<td style="text-align : left;" class="sc">${qna.qtitle }</td>
					</tr>
					<tr>
						<th>Writer</th>
						<td style="text-align : left;" class="sc">
							${qna.qwriter }
						</td>
					</tr>
					<tr>
						<th>Content</th>
						<td style="height : 200px; text-align : left;" class="sc"><pre>${qna.qcontent }</pre></td>
					</tr>
				</table>
				<div class="btn_wrap">
					<c:if test="${member != null && member.mid eq qna.mid }">
						<button onclick="location.href='${conPath}/qna/updateView.do?qno=${qna.qno }&pageNum=${param.pageNum}'">수정</button>
						<button onclick="location.href='${conPath}/qna/delete.do?qno=${qna.qno }&pageNum=${param.pageNum}'">삭제</button>
					</c:if>
					<c:if test="${admin != null && admin.aid eq qna.aid }">
						<button onclick="location.href='${conPath}/qna/updateView.do?qno=${qna.qno }&pageNum=${param.pageNum}'">수정</button>
						<button onclick="location.href='${conPath}/qna/delete.do?qno=${qna.qno }&pageNum=${param.pageNum}'">삭제</button>
					</c:if>
					<c:if test="${admin != null }">
						<button onclick="location.href='${conPath}/qna/replyView.do?qno=${qna.qno }&pageNum=${param.pageNum}'">답글작성</button>
					</c:if>
					<button onclick="location.href='${conPath}/qna/list.do?pageNum=${param.pageNum}'">목록</button>
				</div>
			</div>
			<div id="sub_nav">
			<ul>
				<c:if test="${member != null }">
				<li><a href="${conPath }/qna/list.do?pageNum=1">Q&A목록</a></li>
				<li><a href="${conPath }/qna/writeView.do">Q&A작성</a></li>
				<li><a href="${conPath }/qna/myList.do">My Q&A List</a></li>
				</c:if>
			</ul>
		</div>	
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>