
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/review/reviewList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		//인덱스
		$('#review').addClass('nowIndex');
	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<h1>REVIEW ABOUT</h1>
			<hr>
			<button id="write"
				onclick="location.href='${conPath}/review/write.do'">
				<img class="menu_img" src="${conPath }/img/reviewWrite.png"
					title="글쓰기">
			</button>
			<button id="menu" onclick="location.href='${conPath}/main.do'">
				<img class="menu_img" src="${conPath }/img/timetablemenu.png"
					title="메뉴">
			</button>
			<button id="mylist"
				onclick="location.href='${conPath}/review/myReview.do'">
				<img class="menu_img" src="${conPath }/img/reviewuser.png"
					title="내 글 보기">
			</button>

			<div id="allList">
				<div class="">
					<c:if test="${empty reviewList }">
					해당 글이 존재하지 않습니다
				</c:if>
				</div>
				<c:if test="${not empty reviewList }">
					<c:forEach var="review" items="${reviewList }">
						<div class="rlist">
							<c:if test="${empty review.rfilename }">

								<div>
									<img src="${conPath }/img/reviewNoImg.PNG">
								</div>
							</c:if>
							<c:if test="${not empty review.rfilename }">
								<div>
									<img src="${conPath }/ReviewImgUpload/${review.rfilename }">
								</div>
							</c:if>
							<div class="info">

								<a
									href="${conPath }/review/content.do?rnum=${review.rnum}&pageNum=${reviewPaging.currentPage}&repageNum=1">${review.rtitle }</a>(${review.rcnt })
								<br> ${review.mname }<br> ${review.rrdate }<br>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<div id="paging">
					<c:if test="${not empty reviewPaging }">
						<c:if test="${reviewPaging.startPage > reviewPaging.blockSize }">
					[<a
								href="${conPath }/review/list.do?pageNum=${reviewPaging.startPage-1}&rtitle=${param.rtitle}">이전</a>]
				</c:if>
						<c:forEach var="i" begin="${reviewPaging.startPage }"
							end="${reviewPaging.endPage }">
							<c:if test="${reviewPaging.currentPage == i }">
						${i }
					</c:if>
							<c:if test="${reviewPaging.currentPage != i }">
								<a
									href="${conPath }/review/list.do?pageNum=${i}&rtitle=${param.rtitle}">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${reviewPaging.endPage < reviewPaging.pageCnt }">
					[<a
								href="${conPath }/review/list.do?pageNum=${myPaging.endPage+1}&rtitle=${param.rtitle}">다음</a>]
				</c:if>
					</c:if>
					<c:if test="${not empty myPaging }">
						<c:if test="${myPaging.startPage > myPaging.blockSize }">
					[<a
								href="${conPath }/review/myReview.do?pageNum=${myPaging.startPage-1}&rtitle=${param.rtitle}">이전</a>]
				</c:if>
						<c:forEach var="i" begin="${myPaging.startPage }"
							end="${myPaging.endPage }">
							<c:if test="${myPaging.currentPage == i }">
						${i }
					</c:if>
							<c:if test="${myPaging.currentPage != i }">
								<a
									href="${conPath }/review/myReview.do?pageNum=${i}&rtitle=${param.rtitle}">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${myPaging.endPage < myPaging.pageCnt }">
					[<a
								href="${conPath }/review/myReview.do?pageNum=${myPaging.endPage+1}&rtitle=${param.rtitle}">다음</a>]
				</c:if>
					</c:if>
				</div>

				<div id="search">
					<form id="rsearch" action="${conPath }/review/list.do">
						<select name="shoption">
							<option value=""
								<c:if test="${param.shoption == ''}">selected="selected"</c:if>>검색조건</option>
							<option value="rtitle"
								<c:if test="${param.rtitle == ''}">selected="selected"</c:if>>제목으로
								검색</option>
							<option value="hname"
								<c:if test="${param.hno == ''}">selected="selected"</c:if>>태그로
								검색</option>
						</select> <input type="text" name="shname" value="${param.shname }">
						<input type="submit" value="검색" class="btn_s">
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>