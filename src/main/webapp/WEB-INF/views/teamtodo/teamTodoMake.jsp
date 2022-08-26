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
	<link href="${conPath}/css/team/teamTodoMake.css" rel="stylesheet">
	<style>
		*{
			margin:0;
			padding:0;
		}
		
		div.teamTodoMake{
			border-bottom: 1px solid black;
		}
		div.teamTodoMake table tr td{
			padding: 5px 0;
			text-align: center;
		}
		div.teamTodoMake table tr td input{
			width: 150px;
			height: 25px;
		}
		div.teamTodoMake table tr td select{
			height: 27px;
		}
		div.teamTodoMake table tr td.btn{
			text-align:center;
		}
		div.teamTodoMake table tr td.btn input.btn:hover{
			border-bottom: 1px solid black; 
		}
		div.teamTodoMake table tr td input.btn{
			border: none;
			background-color: white;
			width:50px;
		}
	</style>
</head>
<body>
	<div class="teamTodoMake">
		<form action="${conPath }/teamtodo/make.do" method="post">
			<input type="hidden" name="tno" value=${param.tno }>
			<input type="hidden" name="ttrdate" value=${param.ttrdate }>
			<table>
				<tr><td colspan="2"><h4>TODO</h4></td></tr>
				<tr>
					<td><input type="text" name="ttcontent" required="required" autofocus="autofocus"></td>
					<td>
						<select name="tmno">
							<c:forEach var="list" items="${teamMemberList }">
								<option value="${list.tmno }" 
									<c:if test ="${teamDetail.mid eq list.mid }">selected="selected"</c:if>>${list.mname }(${list.mid })
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn">
						<input type="submit" value="[작 성]" class="btn">
						<input type="reset" value="[초기화]" class="btn">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>