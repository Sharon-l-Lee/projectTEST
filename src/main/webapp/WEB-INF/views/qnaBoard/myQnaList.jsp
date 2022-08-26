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
	<link href="${conPath }/css/qnaboard/list.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#qna').addClass('nowIndex');
		});
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="qnaList">
			<table>
				<caption><h2>My Q&A List</h2></caption>
					<col style="width : 100px;">
					<col style="width : 470px;">
					<col style="width : 210px;">
					<col style="width : 210px;">
					<col style="width : 100px;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:if test="${qnas.size() eq 0 }">
					<tr>
						<td colspan="5">등록된 게시물이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${qnas.size() != 0 }">
					<c:forEach items="${qnas}" var="q">
						<tr>
							<td>${q.qno }</td>
							<td class="title">
								<c:forEach var="i" begin="1" end="${q.qindent }">
									<c:if test="${i eq q.qindent }">
										└
									</c:if>
									<c:if test="${i != q.qindent }">
										&nbsp; &nbsp;
									</c:if>
								</c:forEach>
							<a href="${conPath }/qna/myContent.do?qno=${q.qno}&pageNum=${paging.currentPage}">${q.qtitle }</a>
							</td>
							<td>
								${q.qwriter }
							</td>
							<td>${q.qrdate }</td>
							<td>${q.qhit }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="5" class="bottom"></td>
				</tr>
			</table>
		</div>
		<div class="paging">
				<a href="${conPath }/qna/myList.do?pageNum=${paging.startPage - 1 eq 0 ? 1 : paging.startPage-1}"><img src="${conPath }/img/btn01.gif" height="25"></a>
				<c:forEach var="j" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${j eq paging.currentPage }">
						<b> &nbsp; ${j } &nbsp; </b>
					</c:if>
					<c:if test="${j != paging.currentPage }">
						<a href="${conPath }/qna/myList.do?pageNum=${j}"> &nbsp; ${j } &nbsp; </a>
					</c:if>
				</c:forEach>
				<a href="${conPath }/qna/myList.do?pageNum=${paging.endPage == paging.pageCnt ? paging.endPage : paging.endPage + 1 }"><img src="${conPath }/img/btn0010.gif" height="25"></a>
		</div>
		</div>
		<div id="sub_nav">
			<ul>
				<li><a href="${conPath }/qna/list.do?pageNum=1">Q&A목록</a></li>
				<li><a href="${conPath }/qna/writeView.do">Q&A작성</a></li>
				<li><a href="${conPath }/qna/myList.do">My Q&A List</a></li>
			</ul>
		</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>