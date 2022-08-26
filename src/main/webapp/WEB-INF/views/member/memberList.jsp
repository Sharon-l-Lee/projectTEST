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
	<link href="${conPath}/css/member/memberList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.rc').click(function() {
				var id = $(this).attr('id');
				var answer = confirm('해당 아이디를 복구하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/member/recoverMember.do?mid=' + id;
				} else {
					return false;
				}
			});
			
			$('.dl').click(function() {
				var id = $(this).attr('id');
				var answer = confirm('정말 해당 아이디를 사용중단하시겠습니까?');
				if (answer == true) {
					location.href='${conPath}/member/deleteMember.do?mid=' + id;
				} else {
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${recoverResult eq 0 }">
		<script>
			alert('복구 실패');
		</script>
	</c:if>
	<c:if test="${recoverResult eq 1 }">
		<script>
			alert('복구 성공');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 0 }">
		<script>
			alert('처리 실패');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('처리 성공');
		</script>
	</c:if>
	<div class="wrap" style="background-image: url('../img/main_wraper.png'); border:1px solid white;">
		<div class="memberList_wrap">
		<table class="memberList">
			<tr><td colspan="5" style="font-size:1.8em; font-weight:bold; padding: 20px 0 20px 10px;">MEMBER LIST</td></tr>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>상태</th>
				<th>처리</th>
			</tr>
			<c:forEach items="${memberList }" var="member">
			
				<tr <c:if test="${member.mstatus eq 0 }">
					style="color : red;"
				</c:if>>
					<td>${member.mid }</td>
					<td>${member.mname }</td>
					<td>
						<c:if test="${member.mbirth eq null }">
							-
						</c:if>
						<c:if test="${member.mbirth != null }">
							<fmt:formatDate value="${member.mbirth }" pattern="yyyy년 MM월 dd일"/>
						</c:if>
					</td>
					<td>
						<c:if test="${member.memail eq null }">
							-
						</c:if>
						<c:if test="${member.memail != null }">
							${member.memail }
						</c:if>
					</td>
					<td>
						<c:if test="${member.mstatus eq 0 }">
							사용중단
						</c:if>
						<c:if test="${member.mstatus eq 1 }">
							사용중
						</c:if>
					</td>
					<td style="text-align: center;">
						<button id="${member.mid }" class="rc">복구</button>
						<button id="${member.mid }" class="dl">사용중단</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
				[ <a href="${conPath }/member/memberList.do?pageNum=${paging.startPage - 1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage }">
					<span class="curr">[ <b>${i }</b> ]</span>
				</c:if>
				<c:if test="${i != paging.currentPage }">
					[ <a href="${conPath }/member/memberList.do?pageNum=${i}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < pageCnt }">
				[ <a href="${conPath }/member/memberList.do?pageNum=${paging.endPage + 1}">다음</a> ]
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>