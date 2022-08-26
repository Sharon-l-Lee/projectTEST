<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Account List</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="${conPath }/css/account/list.css" rel="stylesheet">
 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			// 작성 폼 띄우기
			$('#write_button').click(function(){
				var nowDate = '${nowDate }'
				let writeWindow 
					= window.open("${conPath}/account/write.do?nowDate="+nowDate,
									"MyLog : Account Write",
									"width=500, height=350, top=400px, left=900")
			});
			// 수정 폼 띄우기
			$('.modify_button').click(function(){
				var ano = $(this).attr('id');
				let modifyWindow 
					= window.open("${conPath}/account/modify.do?ano="+ano,
									"MyLog : Account Modify",
									"width=500, height=350, top=400px, left=900")
			});
			
			//인덱스
			$('#account').addClass('nowIndex');
		});
	</script>
	<script>
		let category = [];
		let total = [];
	</script>
	<c:forEach var="i" items="${mothlyCategoryTotal }">
		<script>
			category.push('${i.atitle }');
			total.push('${i.total }');
		</script>
	</c:forEach>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script>
		window.onload = function () {
			new Chart(document.getElementById("doughnut-chart"), {
			    type: 'doughnut',
			    data: {
			      labels: category,
			      datasets: [
			        {
			          label: "category(total)",
			          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#9dddff", 
			        	  				"FF7C7C", "FFDBA4", "8FE3CF", "AFB4FF", "A5C9CA", "C4D7E0",
			        	  				"FFDEDE","D6EFED", "D3CEDF", "FCF8E8", "ECB390", "CDC2AE",
			        	  				"B7E5DD", "DEB6AB"],
			          data: total
			        }
			      ]
			    },
			});
			
		}
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="date_wrap">
				<div id="date">
					<div class="before button" onclick="location.href='list.do?nowDate=${before }'">&lt;</div>
					<div class="nowDate">
						<div class="year">
							<fmt:formatDate value="${nowDate }" pattern="yyyy"/>
						</div>
						<div class="month">
							<fmt:formatDate value="${nowDate }" pattern="MM"/>
						</div>
					</div>
					<div class="after button" onclick="location.href='list.do?nowDate=${after }'">&gt;</div>
				</div>
			</div>
			<div id="account_wrap">
				<div id="month_total">
					<div class="total list">
						<div class="title">월 누적 금액</div>
						<div class="content">
							${monthTotal.total == null ? 0 : monthTotal.total}원
						</div>
					</div>
					<div id="inOut">
						<div class="in list">
							<div class="title">
								수입
							</div>
							<div class="content blue">
								${monthTotal.incomeTotal == null ? 0 : monthTotal.incomeTotal }원
							</div>
						</div>
						<div class="out list">
							<div class="title">
								지출
							</div>
							<div class="content red">
								${monthTotal.expenseTotal == null ? 0 : monthTotal.expenseTotal }원
							</div>
						</div>
					</div>
					<div id="category_total">
						<c:if test="${not empty monthlyList }">
							<div class="title">카테고리별 지출 내역</div>
							<canvas id="doughnut-chart"></canvas>
						</c:if>
					</div>
				</div>
				<div id="account_list">
					<div id="list">
						<c:if test="${not empty monthlyList }">
							<c:forEach var="list" items="${monthlyList }">
								<div class="content${list.ano } account_one">
									<span class="small"><fmt:formatDate value="${list.adate }" pattern="MM/dd"/></span>
									<span class="small">
										<c:if test="${list.astatus eq 0 }">
											지출
										</c:if>
										<c:if test="${list.astatus eq 1 }">
											수입
										</c:if>
									</span>
									<span class="content"><p>${list.acontent }</p></span>
									<span class="money">${list.aprice }원</span>
									<button class="modify_button" id="${list.ano }">수정</button>
									<button onclick="location.href='${conPath}/account/delete.do?ano=${list.ano }&nowDate=${nowDate }'">삭제</button>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div id="write_button">가계부 내역 작성하기</div>
					<div class="paging">
						<c:if test="${paging.startPage > paging.blockSize }">
							<a href="${conPath }/account/list.do?nowDate=${nowDate }&pageNum=${paging.currentPage-1 }">[ 이전 ]</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
							<c:if test="${i eq paging.currentPage }">
								[ <b>${i }</b> ]
							</c:if>
							<c:if test="${i != paging.currentPage }">
								<a href="${conPath }/account/list.do?nowDate=${nowDate }&pageNum=${i }">[ ${i } ]</a>
							</c:if>
						</c:forEach>
						<c:if test="${ paging.endPage < paging.pageCnt }">
							<a href="${conPath }/account/list.do?nowDate=${nowDate }&pageNum=${paging.currentPage+1 }">[ 다음 ]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>