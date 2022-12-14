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
<link href="${conPath }/css/noticeboard/list.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#notice').addClass('nowIndex');
	});
</script>
</head>
<body>
	<c:if test="${writeResult eq 0 }">
		<script>
			alert('공지사항 등록 실패');
		</script>
	</c:if>
	<c:if test="${writeResult eq 1 }">
		<script>
			alert('공지사항이 등록되었습니다');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 0 }">
		<script>
			alert('공지사항 삭제 실패');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('공지사항이 삭제되었습니다');
		</script>
	</c:if>
	<div id="main_wrap">
		<div id="wrap">
			<div id="noticeList">
				<table>
					<caption>
						<h2>Notice</h2>
					</caption>
					<col style="width: 135px;">
					<col style="width: 395px;">
					<col style="width: 235px;">
					<col style="width: 235px;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:if test="${notices.size() eq 0 }">
						<tr>
							<td colspan="4">등록된 공지사항이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${notices.size() != 0 }">
						<c:forEach items="${notices}" var="n">
							<tr>
								<td>${n.nno }</td>
								<td class="title"><a
									href="${conPath }/notice/content.do?nno=${n.nno}&pageNum=${paging.currentPage}">${n.ntitle }</a>
								</td>
								<td>${n.nrdate }</td>
								<td>${n.nhit }</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="5" class="bottom"></td>
					</tr>
				</table>
				<div class="paging">
					<a
						href="${conPath }/notice/list.do?pageNum=${paging.startPage - 1 eq 0 ? 1 : paging.startPage-1}"><img
						src="${conPath }/img/btn01.gif" height="25"></a>
					<c:forEach var="j" begin="${paging.startPage }"
						end="${paging.endPage }">
						<c:if test="${j eq paging.currentPage }">
							<b>&nbsp; ${j } &nbsp;</b>
						</c:if>
						<c:if test="${j != paging.currentPage }">
							<a href="${conPath }/notice/list.do?pageNum=${j}">&nbsp; ${j }
								&nbsp;</a>
						</c:if>
					</c:forEach>
					<a
						href="${conPath }/notice/list.do?pageNum=${paging.endPage == paging.pageCnt ? paging.endPage : paging.endPage + 1 }"><img
						src="${conPath }/img/btn0010.gif" height="25"></a>
				</div>
			</div>
			<div id="sub_nav">
				<c:if test="${admin != null }">
					<a href="${conPath }/notice/writeView.do">공지작성</a>
				</c:if>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>