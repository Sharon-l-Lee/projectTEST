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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		function replyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/replyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#replyDiv').html(data);
				}
			});
		}
		function modifyComment(tcnum, pageNum, tnum, tcpageNum) {
			$.ajax({
				url : '${conPath}/teamcomment/modifyView.do',
				data : { 'tcnum': tcnum, 'pageNum': pageNum, 'tnum':tnum , 'tcpageNum':tcpageNum },
				type : 'get',
				dataType : 'html',
				success : function(data, status) {
					$('#modifyDiv').html(data);
				}
			});
		}
	</script>
</head>
<body>
	<c:if test="${teamboarddeleteResult eq 1 }">
		<script>
			alert('댓글삭제 성공');
		</script>
	</c:if>
	<c:if test="${teamboarddeleteResult eq 0 }">
		<script>
			alert('댓글삭제 실패');
		</script>
	</c:if>
	<div id="content">
		<table>
			<caption>${content.tnum }번상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${content.mid }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${content.ttitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${content.tcontent }</td>
			</tr>
			<tr>
				<th>파일</th>
				<c:if test="${content.tfilename eq null }">
					<td>파일 없음</td>
				</c:if>
				<c:if test="${content.tfilename != null }">
					<td>${content.tfilename }</td>
				</c:if>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${content.thit }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${content.trdate }</td>
			</tr>
			<tr>
				<th>ip</th>
				<td>${content.tip }</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="목록"
					onclick="location.href='${conPath}/teamboard/list.do?pageNum=${pageNum }'"
					class="btn"> 
				<input type="button" value="답변"
					onclick="location.href='${conPath}/teamboard/replyView.do?tnum=${content.tnum}&pageNum=${pageNum }'"
					class="btn"> 
				<input type="button" value="수정"
					onclick="location.href='${conPath}/teamboard/modifyView.do?tnum=${content.tnum}&pageNum=${pageNum }'"
					class="btn"> 
				<input type="button" value="삭제"
					onclick="location.href='${conPath}/teamboard/delete.do?tnum=${content.tnum}&pageNum=${pageNum }'"
					class="btn"></td>
			</tr>
		</table>
		<form action="${conPath }/teamcomment/write.do" method="post">
			<input type="hidden" name="tnum" value="${content.tnum }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<th><input type="text" name="mid" required="required">
					<%-- ${param.mid } --%></th>
					<td><input type="text" name="tccontent" required="required"></td>
					<td><input type="submit" value="글쓰기" class="btn"></td>
				</tr>
			</table>
		</form>
		<table>
			<c:if test="${teamCommentTotCnt eq 0 }">
				<tr>
					<td>등록된 댓글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${teamCommentTotCnt ne 0 or teamCommentTotCnt ne null}">
				<c:forEach items="${teamcommentList }" var="tcDto">
					<tr>
						<td id="tcnum">${tcDto.tcnum }</td>
						<td>${tcDto.mid }</td>
						<td class="left">
							<c:forEach var="i" begin="1" end="${tcDto.tcindent }">
								<c:if test="${i==tcDto.tcindent }">
				  					└
				  				</c:if>
								<c:if test="${i!=tcDto.tcindent }">
				  					&nbsp; &nbsp; &nbsp;
				  				</c:if>
							</c:forEach> 
							${tcDto.tccontent }
						</td>
						<td>
							<button
								onclick="replyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${param.tcpageNum }')">답댓글</button>
							<!-- <button 
								id="hide">취소</button> -->
							<button 
								onclick="modifyComment('${tcDto.tcnum}', '${param.pageNum}', '${content.tnum }', '${param.tcpageNum }')">수정</button>
							<button 
								onclick="location.href='${conPath}/teamcomment/delete.do?tnum=${content.tnum}&pageNum=${pageNum }&tcnum=${tcDto.tcnum }'">삭제</button>
						</td>
					</tr>
					<div id="modifyDiv"></div>
				</c:forEach>
					<div id="replyDiv"></div>
			</c:if>
		</table>
		<div id="paging">
				<c:if test="${tcpaging.startPage > tcpaging.blockSize }">
					[<a href="">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${tcpaging.startPage }" end="${tcpaging.endPage }">
					<c:if test="${tcpaging.currentPage == i }">
						${i }
					</c:if>
					<c:if test="${tcpaging.currentPage != i }">
					<a href="${conPath }/teamboard/content.do?tnum=${content.tnum}&pageNum=${param.pageNum }&tcpageNum=${tcpageNum }'">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${tcpaging.endPage < tcpaging.pageCnt }">
					[<a href="">다음</a>]
				</c:if>
				
			</div>
	</div>
</body>
</html>