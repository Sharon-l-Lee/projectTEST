<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : Account Daily List</title>
 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			// 작성 폼 띄우기
			$('#write_button').click(function(){
				var nowDate = '${nowDate }'
				let writeWindow 
					= window.open("${conPath}/account/write.do?nowDate="+nowDate,
									"MyLog : Account Write",
									"width=400, height=200, top=400px, left=900")
			});
			// 수정 폼 띄우기
			$('.modify_button').click(function(){
				var ano = $(this).attr('id');
				let modifyWindow 
					= window.open("${conPath}/account/modify.do?ano="+ano,
									"MyLog : Account Modify",
									"width=400, height=200, top=400px, left=900")
			});
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
			          label: "category (total)",
			          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
			          data: total
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '월 지출 비율'
			      }
			    }
			});
			
		}
	</script>
</head>
<body>
	<div id="main_wrap">
		<div id="month">
			<a href="list.do?nowDate=${before }">이전</a>
			<fmt:formatDate value="${nowDate }" pattern="yyyy년 MM월"/>
			<a href="list.do?nowDate=${after }">이후</a>
		</div>
		<div id="month_total">
			<table>
				<tr>
					<th colspan="2">월 누적 금액</th>
				</tr>
				<tr>
					<td colspan="2">${monthTotal.total == null ? 0 : monthTotal.total}</td>
				</tr>
				<tr>
					<th>수입</th>
					<th>지출</th>
				</tr>
				<tr>
					<td>${monthTotal.incomeTotal == null ? 0 : monthTotal.incomeTotal }원</td>
					<td>${monthTotal.expenseTotal == null ? 0 : monthTotal.expenseTotal }원</td>
				</tr>
			</table>
		</div>
		<div id="category_total">
			<canvas id="doughnut-chart" width="100" height="100"></canvas>
		</div>
		<div id="list">
			<div id="write_button">+ 가계부 내역 작성하기</div>
			<c:if test="${not empty monthlyList }">
				<c:forEach var="list" items="${monthlyList }">
					<div class="content${list.ano }">
						<span><fmt:formatDate value="${list.adate }" pattern="MM/dd"/></span>
						<span>
							<c:if test="${list.astatus eq 0 }">
								지출
							</c:if>
							<c:if test="${list.astatus eq 1 }">
								수입
							</c:if>
						</span>
						<span>${list.acontent }</span>
						<span>${list.aprice }원</span>
						<button class="modify_button" id="${list.ano }">수정</button>
						<button onclick="location.href='${conPath}/account/delete.do?ano=${list.ano }&nowDate=${nowDate }'">삭제</button>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>