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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function trClicked(tnum){
			location.href = '${conPath}/teamboard/content.do?tnum='+tnum+'&pageNum=${paging.currentPage}'+'&tcpageNum=1';
		}
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
	<table>
		<tr>
			<td><a href="${conPath }/teamboard/writeView.do">글쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${teamBoardTotCnt eq 0 }">
			<tr>
				<td colspan="5">등록된 글이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${teamBoardTotCnt != 0 }">
			<c:forEach items="${teamboardList }" var="tbDto">
				<tr	onclick="trClicked(${tbDto.tnum})">
	  				<td>${tbDto.tnum }</td>
	  				<td>${tbDto.mid }</td>
					<td class="left">
	  					<c:forEach var="i" begin="1" end="${tbDto.tindent }">
	  						<c:if test="${i==tbDto.tindent }">
	  							└
	  						</c:if>
	  						<c:if test="${i!=tbDto.tindent }">
	  								&nbsp; &nbsp; &nbsp;
	  						</c:if>
	  					</c:forEach>
	  					${tbDto.ttitle }
	  				</td>
					<td>
	  					<fmt:formatDate value="${tbDto.trdate }" pattern="yy/MM/dd(E)"/>
	  				</td>
	  				<td>
	  					<fmt:formatNumber value="${tbDto.thit }" groupingUsed="true"/>	<!-- 3자리수 마다 , -->
	  				</td>
						
				</tr>
			</c:forEach>
		</c:if>
	</table>
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
</body>
</html>