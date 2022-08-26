<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/team/list.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function divClicked(tnum){
			location.href = '${conPath}/teamboard/content.do?tnum='+tnum+'&pageNum=${paging.currentPage}'+'&tcpageNum=1';
		}
	</script>
	<script>
		//인덱스
		$('#myList').addClass('nowIndex');
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<!-- 글쓰기 성공/실패 alert -->
	<c:if test="${teamboardwriteResult eq SUCCESS }">
		<script>
			alert("팀모집 게시판 글쓰기 성공");
		</script>
	</c:if>
	<c:if test="${teamboardwriteResult eq FAIL }">
		<script>
			alert("팀모집 게시판 글쓰기 실패");
			history.back();
		</script>
	</c:if>
	<!-- 글삭제 성공/실패 alert -->
	<c:if test="${teamboarddeleteResult eq SUCCESS }">
		<script>
			alert("팀모집 게시판 글삭제 성공");
		</script>
	</c:if>
	<c:if test="${teamboarddeleteResult eq FAIL }">
		<script>
			alert("팀모집 게시판 글삭제 실패");
			history.back();
		</script>
	</c:if>
	<!-- 글답변 성공/실패 alert -->
	<c:if test="${teamboardreplyResult eq SUCCESS }">
		<script>
			alert("팀모집 게시판 답변글 작성 성공");
		</script>
	</c:if>
	<c:if test="${teamboardreplyResult eq FAIL }">
		<script>
			alert("팀모집 게시판 답변글 작성 실패");
			history.back();
		</script>
	</c:if>
<div class="wrap" style="background-image: url('../img/main_wraper.png'); border: 1px solid white;" >	
	<div class="list_wrap">
		<div class="lnb">
			<ul>
				<li><a href="${conPath }/teamboard/list.do">그룹 모집 게시판</a></li>
				<li><a href="${conPath }/team/list.do">그룹원 모집</a></li>
			</ul>
		</div>
	<div class="write">
		<a href="${conPath }/teamboard/writeView.do">글쓰기</a></td>
	</div>
	<div class="list">
		<c:if test="${teamBoardTotCnt eq 0 }">
			<p>등록된 글이 없습니다</p>
		</c:if>
		<c:if test="${teamBoardTotCnt != 0 }">
			<c:forEach items="${teamboardList }" var="tbDto">
				<div onclick="divClicked(${tbDto.tnum})">
					<table class="thing" style="border: 1px solid black;">
						<tr>
							<td><h3>${tbDto.ttitle }</h3></td>
						</tr>
						<tr>
							<td style="text-align: right">(<fmt:formatNumber value="${tbDto.thit }" groupingUsed="true"/>)</td>
						</tr>
						<tr>
							<td>${tbDto.mname }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div class="paging">
	  	<c:if test="${paging.startPage > paging.blockSize }">
	  		[ <a href="${conPath }/teamboard/list.do?pageNum=${paging.startPage-1 }"> 이 전 </a>]
	  	</c:if>
	  	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	  		<c:if test="${i eq paging.currentPage }">
	  			[ <b>${i }</b> ]
	  		</c:if>
	  		<c:if test="${i != paging.currentPage }">
	  			[ <a href="${conPath }/teamboard/list.do?pageNum=${i }">${i }</a> ]
	  		</c:if>
	  	</c:forEach>
	  	<c:if test="${paging.endPage < paging.pageCnt }">
	  		[ <a href="${conPath }/teamboard/list.do?pageNum=${paging.endPage+1 }"> 다 음 </a>]
	  	</c:if>
  	</div>
  	<script>
		$(document).ready(function(){
			//인덱스
			$('#teamboard').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
	</div>
</div>
</body>
</html>