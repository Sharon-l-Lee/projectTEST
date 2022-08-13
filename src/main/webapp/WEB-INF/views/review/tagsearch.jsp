
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
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		$('#rsearch').submit(function(){
		 	var option = $("#rsearch option:selected").val();
		 	console.log(option);
			var rtitle = $('input[name=rtitle]').val();
			var hname = $('#hname').val();
			 
		 if(option == 1){
			 $.ajax({
					type : 'post', // 타입 (get, post, put 등등)
					url : '${conPath}/review/list.do', // 요청할 서버url
					dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
					data :'rtitle='+rtitle,
					success : function(data) { // 결과 성공 콜백함수
						

					},

				})

		 }else if(option == 2){
			 $.ajax({
					type : 'post', // 타입 (get, post, put 등등)
					url : '${conPath}/review/search.do', // 요청할 서버url
					dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
					data :'hname='+hname,
					success : function(data) { // 결과 성공 콜백함수
						

					},

				})

		 }
		});
		     
	});
</script>
</head>
<body>
	<button onclick="location.href='${conPath}/review/write.do'">글쓰기</button>
	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>댓글개수</th>
		</tr>
		<c:if test="${empty searchList }">
			해당 글이 존재하지 않습니다
		</c:if>
		<c:if test="${not empty searchList }">
		<c:forEach var="search" items="${searchList }">
			<tr>
				<td>${search.rnum }</td>
				<td><a
					href="${conPath }/review/content.do?rnum=${search.rnum}&pageNum=${reviewPaging.currentPage}&repageNum=1">${search.rtitle }</a></td>
				<td>${search.mname }</td>
				<td>${search.rrdate }</td>
				<td>${search.cnt }</td>
			</tr>
		</c:forEach>
		</c:if>
		
	</table>
	<div id="paging">
		<c:if test="${reviewPaging.startPage > reviewPaging.blockSize }">
					[<a href="">이전</a>]
				</c:if>
		<c:forEach var="i" begin="${reviewPaging.startPage }"
			end="${reviewPaging.endPage }">
			<c:if test="${reviewPaging.currentPage == i }">
						${i }
					</c:if>
			<c:if test="${reviewPaging.currentPage != i }">
				<a href="${conPath }/review/list.do?pageNum=${i}">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${reviewPaging.endPage < reviewPaging.pageCnt }">
					[<a href="">다음</a>]
				</c:if>

	</div>

	<div id="search">
		<form id="rsearch">
		<select>
			<option value="1">제목으로 검색</option>
			<option value="2">태그로 검색</option>
		</select>
		
			<input type="text" name="rtitle" id="hname"> 
			<input type="submit" value="검색" >
		</form>
	</div>
</body>
</html>