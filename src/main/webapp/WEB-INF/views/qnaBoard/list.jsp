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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<c:if test="${writeResult eq 0 }">
		<script>
			alert('질문 등록 실패');
		</script>
	</c:if>
	<c:if test="${writeResult eq 1 }">
		<script>
			alert('질문이 등록되었습니다');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 0 }">
		<script>
			alert('삭제 실패');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('삭제되었습니다');
		</script>
	</c:if>
	<c:set var="iNum" value="${paging.inverseNum }"/>
	<div>
		<a href="${conPath }/qna/writeView.do">qna작성</a>
   		<a href="${conPath }/qna/myList.do">myList</a>
		<div class="content">
			<h1>ALL LIST</h1>
			<table>
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
							<td>${iNum }</td>
							<td class="title">
								<c:forEach var="i" begin="1" end="${q.qindent }">
									<c:if test="${i eq q.qindent }">
										└
									</c:if>
									<c:if test="${i != q.qindent }">
										&nbsp; &nbsp;
									</c:if>
								</c:forEach>
							<a
								href="${conPath }/qna/content.do?qno=${q.qno}&pageNum=${paging.currentPage}">${q.qtitle }</a>
							</td>
							<td>
								${q.qwriter }
							</td>
							<td>${q.qrdate }</td>
							<td>${q.qhit }</td>
						</tr>
						<c:set var="iNum" value="${iNum - 1 }"/>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div class="paging">
				<a href="${conPath }/qna/list.do?pageNum=${paging.startPage - 1 eq 0 ? 1 : paging.startPage-1}">이전</a>
				<c:forEach var="j" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${j eq paging.currentPage }">
						<b> ${j } </b>
					</c:if>
					<c:if test="${j != paging.currentPage }">
						<a href="${conPath }/qna/list.do?pageNum=${j}"> ${j } </a>
					</c:if>
				</c:forEach>
				<a href="${conPath }/qna/list.do?pageNum=${paging.endPage == paging.pageCnt ? paging.endPage : paging.endPage + 1 }">다음</a>
		</div>
	</div>
</body>
</html>