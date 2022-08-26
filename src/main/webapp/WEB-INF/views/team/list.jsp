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
		function divClicked(tno){
			location.href = '${conPath}/team/teamDetailView.do?tno='+tno+'&pageNum=${paging.currentPage}'+'&mid=${member.mid}';
		}
	</script>
	<style>
	div.lnb ul li a:hover{
		border-bottom: 1px solid black;
	}
	div.list div table.thing:hover{
		border: 2px solid black;
		transform: scale(1.1);
	}
	</style>
</head>
<body>
<div class="wrap" style="background-image: url('../img/main_wraper.png'); border: 1px solid white;" >
	<div class="list_wrap">
	<div class="lnb">
		<ul>
			<li><a href="${conPath }/teamboard/list.do">그룹 모집 게시판</a></li>
			<li><a href="${conPath }/team/list.do">그룹원 모집</a></li>
		</ul>
	</div>
	<div class="search">
		<form action="${conPath }/team/list.do" method="post">
			<div class="selectBox">
				<select name="schItem" class="select">
					<option value="" <c:if test="${param.schItem == ''}">selected="selected"</c:if> >검색조건</option>
					<option value="all" <c:if test="${param.schItem == 'all'}">selected="selected"</c:if> >그룹명+팀장</option>
					<option value="tname" <c:if test="${param.schItem == 'tname'}">selected="selected"</c:if> >그룹명</option>
					<option value="mname" <c:if test="${param.schItem == 'mname'}">selected="selected"</c:if> >팀장</option>
				</select>
			</div>
			<input type="text" name="schWord" value="${param.schWord }">
			<input type="submit" value="[검색]" class="btn">
		</form>
		<a href="${conPath}/team/makeTeamView.do">[그룹만들기]</a>
	</div>
	<div class="list">
		<c:if test="${empty teamList }">
			<p>등록된 그룹이 없습니다</p>
		</c:if>
		<c:if test="${teamBoardTotCnt != 0 }">
			<c:forEach items="${teamList }" var="tDto">
				<div onclick="divClicked(${tDto.tno})">
					<table class="thing" style="border: 1px solid black;">
						<tr>
							<td><h3>${tDto.tname }</h3></td>
						</tr>
						<tr>
							<td>MOTTO : ${tDto.tgoal }</td>
						</tr>
						<tr>
							<td>${tDto.mname }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div class="paging">
	  	<c:if test="${paging.startPage > paging.blockSize }">
	  		[ <a href="${conPath }/team/list.do?pageNum=${paging.startPage-1 }"> 이 전 </a>]
	  	</c:if>
	  	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	  		<c:if test="${i eq paging.currentPage }">
	  			[ <b>${i }</b> ]
	  		</c:if>
	  		<c:if test="${i != paging.currentPage }">
	  			[ <a href="${conPath }/team/list.do?pageNum=${i }">${i }</a> ]
	  		</c:if>
	  	</c:forEach>
	  	<c:if test="${paging.endPage < paging.pageCnt }">
	  		[ <a href="${conPath }/team/list.do?pageNum=${paging.endPage+1 }"> 다 음 </a>]
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