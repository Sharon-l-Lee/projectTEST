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
<link href="${conPath }/css/team/myTeamDetail.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('select[name="year"], select[name="month"]').change(function(){
				$('form').submit();
			});
		});
		function myTeamModify(tno){
			location.href = '${conPath}/team/myTeamModifyView.do?tno='+tno;
		}
	
		$(document).ready(function(){
			// 토글
			$('.toggle').hide();
			$('.toggle_button').click(function(){
				var ttno = $(this).attr('id');
				$('.toggle'+ttno).toggle();
				$('.toggle:not(.toggle'+ttno+')').hide();
			})
			
			// 투두 만들기
			$('#teamTodo_make').click(function(){
				var tno = $(this).attr('name');
				var ttrdate =  '${ttrdate }';
				$.ajax({
					url : '${conPath}/teamtodo/makeView.do',
					data : 'tno='+tno+'&ttrdate='+ttrdate,
					type : 'get',
					success : function(data){
						$('#teamTodo_make_form').html(data);
					}
				})
			});
			
			// 투두 수정
			$('.team_todoModify').click(function(){
				var tno = '${teamDetail.tno }';
				var ttno = $(this).attr('name');
				var ttrdate =  '${ttrdate }';
				$.ajax({
					url : '${conPath}/teamtodo/modifyView.do',
					data : 'tno='+tno+'&ttno='+ttno+'&ttrdate='+ttrdate,
					type : 'get',
					success : function(data, status) {
						$('#teamTodo_modify_form').html(data);
					}
				})
				
			}); 
			
		});
		
	</script>
</head>
<body>
	<c:if test="${myTeamModifyResult  eq 1}">
		<script>
			alert('그룹 디테일 수정 성공');
		</script>
	</c:if>
	<c:if test="${myTeamModifyResult  eq 0}">
		<script>
			alert('그룹 디테일 수정 실패');
			history.back();
		</script>
	</c:if>
<div class="wrap" style="background-image: url('../img/main_wraper.png');">
	<div class="myTeamDetail_wrap">
	<div id="myTeamDetailHeader">
	<!-- 그룹디테일(헤더, 수정하러가기) -->
	<div class="myTeamDetail">
		<table
			<c:if test="${member.mid eq teamDetail.mid }">
				onclick="myTeamModify(${teamDetail.tno})"
			</c:if>>
			<tr>
				<td><h2>${teamDetail.tname }</h2></td>
				<td style="padding-left: 20px;">(${teamDetail.mname } | ${teamMemberTotCnt })</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top: 5px;">MOTTO : ${teamDetail.tgoal }</td>
			</tr>
		</table>
	</div>

	<!-- 그룹가입 신청자 list -->
	<c:if test="${member.mid eq teamDetail.mid }">
		<div class="myTeamApplyList">
			<a href="${conPath }/teammember/teamApplyList.do?tno=${teamDetail.tno }">그룹가입 신청자 list</a>
		</div>
	</c:if>
	</div>
	
	<div id="myTeamDetailMain">
	<!-- 달력 -->
	<div class="myTeamMontly">
		<h2>${year }년${month }월</h2>
		<form action="${conPath }/team/myTeamDetailView.do">
			<input type="hidden" name="tno" value="${teamDetail.tno }">
			<div class="selectBox">
			<select name="year" class="select">
				<c:forEach var="i" begin="${year-10 }" end="${year+10 }">
					<c:if test="${i eq year }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != year }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
			<div class="selectBox">
			<select name="month" class="select">
				<c:forEach var="i" begin="1" end="12">
					<c:if test="${i eq month }">
						<option selected="selected">${i }</option>
					</c:if>
					<c:if test="${i != month }">
						<option>${i }</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
		</form>
		<table>
			<tr>
				<c:forEach var="t" items="${calPrint.title }">
					<th>${t }</th>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="6">
						<c:if test="${empty calPrint.calDate[i][j] }">
							<td></td>
						</c:if>
						<c:if test="${not empty calPrint.calDate[i][j] }">
							<td
								onclick="location.href='${conPath}/teamtodo/todoList.do?year=${year }&month=${month }&day=${calPrint.calDate[i][j] }&tno=${teamDetail.tno }'">
								<h3>${calPrint.calDate[i][j] }</h3>
							</td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- teamTodoList -->
	<div id="teamTodo_list_wrap">
		<div class="teamTodo_list_header">
			<h4>TODO LIST(${ttrdate })</h4>
		</div>
		<div id="teamTodo_list">
			<c:if test="${empty teamTodoList }">
				<div class="team_todo">
					<span style="text-align: center;">생성된 할 일이 없습니다.</span>
				</div>
			</c:if>
			<c:if test="${not empty teamTodoList }">
				<c:forEach var="todo" items="${teamTodoList }">
					<div id="team_todo${todo.ttno }" class="team_todo">
						<span 
							<c:if test="${todo.mid eq member.mid }">
								onclick="location.href='${conPath}/teamtodo/teamTodoCheck.do?ttno=${todo.ttno }&ttrdate=${ttrdate }&tno=${teamDetail.tno }&ttcheck=${todo.ttcheck }'"
							</c:if>>
							<img alt="체크이미지${todo.ttcheck }" src="${conPath }/img/checkImg${todo.ttcheck }.png">
						</span>
						<span class="ttcontent${todo.ttno }">${todo.ttcontent }</span>
						<span style="font-size: 0.9em; color: #5D8BF4;" 
							<c:if test="${todo.mid eq member.mid }">
								class="toggle_button" id="${todo.ttno }"
							</c:if>
						>
							@${todo.mname }
						</span>
						<div class="toggle toggle${todo.ttno}" id="todoList_btn">
							<button class="team_todoModify" name="${todo.ttno }">[수정]</button>
							<button onclick="location.href='${conPath}/teamtodo/delete.do?ttno=${todo.ttno }&ttrdate=${ttrdate }&tno=${teamDetail.tno }'">[삭제]</button>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div style="padding:10px; border-bottom:1px solid black; text-align: center;"> &nbsp; </div>
			<div id="teamTodo_make_form"></div>
			<div id="teamTodo_modify_form"></div>
			<div id="teamTodo_make" name=${teamDetail.tno }>
				<span>+</span>
				<span>새로운 투두 만들기</span>
			</div>
		</div>
	</div>
	
	</div>
	
	<script>
		$(document).ready(function(){
			//인덱스
			$('#group').addClass('nowIndex');
	  	});
	</script>
	<jsp:include page="../main/header.jsp"/>
	</div>
</div>	
</body>
</html>