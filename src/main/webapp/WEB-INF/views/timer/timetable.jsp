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
<style>
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<link href="${conPath }/css/timer/timetable.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		$('#daily').addClass('nowIndex');

		//타임테이블 출력
		var array = [];
		var tableList = ${tableIdList};
		$(tableList).each(function(idx, list) {
			array.push(list);

		});

		$(array).each(function(idx, item) {
			var tname = item.tname;
			var tbshour = item.tbshour;
			var tbsmin = item.tbsmin;
			var tbehour = item.tbehour;
			var tbemin = item.tbemin;
			var tduring = item.tduring;
			if (tbsmin < 10) {
				tbsmin = '0' + tbsmin;
			}
			if (tbemin < 10) {
				tbemin = '0' + tbemin;

			}
			var stime = Number(tbshour + tbsmin);
			var etime = Number(tbehour + tbemin);

			/* 	for(var i in tname){
					document.getElementById('do').innerHTML += "<h4>"+tname+"</h4>";
					
				} */

			for (var idx = stime; idx < etime; idx++) {
				$('.' + idx).css('background-color', 'lightgray');

			}

		});

		//색 변경

		$('button').click(function() {

			var color = $(this).attr('id');
			console.log(color);

			var array = [];
			var tableList = ${tableIdList};
			$(tableList).each(function(idx, list) {
				array.push(list);

			});

			$(array).each(function(idx, item) {
				var tname = item.tname;
				var tbshour = item.tbshour;
				var tbsmin = item.tbsmin;
				var tbehour = item.tbehour;
				var tbemin = item.tbemin;
				var tduring = item.tduring;
				if (tbsmin < 10) {
					tbsmin = '0' + tbsmin;
				}
				if (tbemin < 10) {
					tbemin = '0' + tbemin;

				}
				var stime = Number(tbshour + tbsmin);
				var etime = Number(tbehour + tbemin);

				/* 	for(var i in tname){
						document.getElementById('do').innerHTML += "<h4>"+tname+"</h4>";
						
						
					} */

				for (var idx = stime; idx < etime; idx++) {
					$('.' + idx).css('background-color', color);

				}

			});

		});

	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<div id="timetable">
				<h1>DAY CALENDAR</h1>
				<div class="pbtn">
					<button onclick="location.href='${conPath}/timetable/view.do?tdate=${prev}'"> &lt; </button>
				</div>
				
				<div class="col-sm-6">


					<div id="colors">
						<button id="#f4cccc">
							<img src="${conPath }/img/f4cccc.PNG">
						</button>
						<button id="#fbe4cd">
							<img src="${conPath }/img/fbe4cd.PNG">
						</button>
						<button id="#fdf2cc">
							<img src="${conPath }/img/fdf2cc.PNG">
						</button>
						<button id="#d9ead3">
							<img src="${conPath }/img/d9ead3.PNG">
						</button>
						<button id="#d0e0e3">
							<img src="${conPath }/img/d0e0e3.PNG">
						</button>
						<button id="#cfe2f2">
							<img src="${conPath }/img/cfe2f2.PNG">
						</button>
						<button id="#d9d2e9">
							<img src="${conPath }/img/d9d2e9.PNG">
						</button>
						<button id="#ead1dc">
							<img src="${conPath }/img/ead1dc.PNG">
						</button>

					</div>
					<div class="nbtn">
					<button onclick="location.href='${conPath}/timetable/view.do?tdate=${next}'"> &gt; </button>
				</div>
					<div id="table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col">10</th>
									<th scope="col">20</th>
									<th scope="col">30</th>
									<th scope="col">40</th>
									<th scope="col">50</th>
									<th scope="col">60</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="5" end="24">
									<tr class="${i}">
										<th>${i }</th>
										<td class="${i}10"></td>
										<td class="${i}20"></td>
										<td class="${i}30"></td>
										<td class="${i}40"></td>
										<td class="${i}50"></td>
										<td class="${i}60"></td>
									</tr>

								</c:forEach>
								<c:forEach var="i" begin="1" end="4">
									<tr class="${i}">
										<th>${i }</th>
										<td class="${i}10"></td>
										<td class="${i}20"></td>
										<td class="${i}30"></td>
										<td class="${i}40"></td>
										<td class="${i}50"></td>
										<td class="${i}60"></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<div class="tprint">
				<h3>What to do?</h3>
				<div class="tdocontent">
					<c:forEach var="time" items="${tableIdList }">
						<div>${time.tname }
							<span class="during">${time.tduring }분</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="menu">
				<button
					onclick="window.open('${conPath}/timer/setting.do','_blank', 'width=630, height=400');return false">
					<img src="${conPath }/img/stopwatch.png">
				</button>
				<button onclick="location.href='${conPath}/main.do'">
					<img src="${conPath }/img/timetablemenu.png">
				</button>
			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>