
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
#comment {
	border: 1px solid black;
}
</style>
<%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
	
		//댓글 쓰기
		$('#cwrite').click(function() {
			/* var rnum = $('input[name=rnum]').val();
			var mid = $('input[name=mid]').val();
			var rpcontent = $('#rpcontent').val();
			var rpip = $('input[name=rpip]').val(); */

			/* 	var all = rnum+mid+rpcontent+rpip;
				console.log(all); */
			$.ajax({
				type : 'post', // 타입 (get, post, put 등등)
				url : '${conPath}/reply/write.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data :$("#wform").serialize(),
				success : function(data) { // 결과 성공 콜백함수
					$("#rpcontent").val("");

				},

			})

		});
		
		//댓글 수정
		
		 $('.modifyview').click(function () {
			var rpnum = $(this).attr('id');
			var rnum = $('#rnum'+rpnum).text();
			var rpcontent = $('#rpcontent'+rpnum).text();
		
		
			 	$.ajax({
				type: 'get',
				url: '${conPath}/reply/modify.do',
				dataType: 'html',
				data: { 'rpnum': rpnum, 'rpcontent': rpcontent, 'rnum':rnum },
				success: function (data) { 
					$('#append'+rpnum).append(data);
					$('#rpcontent'+rpnum).hide();
					
				},

	        }) 
		}); 
		 
		 
		//대댓글
		 $('.recomment').click(function () {
			var rpnum = $(this).attr('id');
			var rnum = $('#rnum'+rpnum).text();
			
		
		
			 	$.ajax({
				type: 'get',
				url: '${conPath}/reply/comment.do',
				dataType: 'html',
				data: { 'rpnum': rpnum,'rnum':rnum },
				success: function (data) { 
					$('#appendwrite'+rpnum).append(data);
					
				},

	        }) 
		}); 
		 
		 
		 
		 
		 
	});
	

</script>
</head>
<body>
	<div id="title">
		${reviewContent.rtitle }
		<!-- 태그도 넣기 -->
	</div>
	<div id="nav">${reviewContent.rrdate }/ ${reviewContent.mname }</div>

	<div id="content">${reviewContent.rcontent }${relist.rpdate }</div>
	
	<div id="tag">
		<c:forEach var="t" items="${tags }">
			<span>#${t.hname }</span>
		</c:forEach>
	</div>
	<button
		onclick="location.href='${conPath}/review/modify.do?rnum=${reviewContent.rnum}'">수정</button>
	<button
		onclick="location.href='${conPath}/review/delete.do?rnum=${reviewContent.rnum}'">삭제</button>
	<button onclick="location.href='${conPath}/review/list.do'">목록</button>
	<%-- <button
		onclick="location.href='${conPath}/review/replylist.do?rnum=${reviewContent.rnum}'">댓글목록</button> --%>
	<div id="cmtwrite">
		<%-- 	<form action="${conPath }/review/replywrite.do" method="post"> --%>
		<form name="wform" id="wform" method="post">
			<input type="text" name="rnum" value="${reviewContent.rnum }">
			<input type="text" name="mid" value="AAA">
			<textarea rows="5" cols="10" id="rpcontent" name="rpcontent"></textarea>
			<input type="text" name="rpip" value="120.12.10">
			<button id="cwrite">작성</button>
		</form>
		<!-- 	</form> -->
	</div>
	<div id="cmtlist">
	</div>
		<div id="comment">
		
		<c:if test="${empty replylist }">
			<div class="reply">
				등록된 댓글이 없습니다
			</div>
		</c:if>
		<c:if test="${not empty replylist }">
			<c:forEach items="${replylist }" var="relist">
			<c:if test="${relist.rpindent eq 1 }">
			 └─ &nbsp; &nbsp;
			</c:if>
			<c:if test="${relist.rpmention != null}">
				<div>@ ${relist.rpmention }</div>
			</c:if>
				<div class="reply">
		
					<div id="${relist.rnum }" style="display:none;">${relist.rnum }</div>
					<div id="rnum${relist.rpnum }" style="display:none;">${relist.rnum }</div> 
					<div id="">작성자 : ${relist.mname }</div>
					<div id="append${relist.rpnum }"></div>
					<div id="rpcontent${relist.rpnum }">
					<c:if test="${empty replyModify }">
						${relist.rpcontent }
					</c:if>
					<c:if test="${not empty replyModify }">
						${replyModify.rpcontent }
					</c:if>
						
						</div>
					<div id="">작성일: ${relist.rpdate }</div>
					
					
					 
					<button id="${relist.rpnum }" class="modifyview">수정</button>
					<!-- 
						onclick="location.href='${conPath}/review/replymodify.do?rpnum=${relist.rpnum}'"
						onclick="location.href='${conPath}/review/replycomment.do?rpnum=${relist.rpnum}'" -->
					<button
						onclick="location.href='${conPath}/reply/delete.do?rpnum=${relist.rpnum}&rnum=${relist.rnum }'">삭제</button>
					<button id="${relist.rpnum }" class="recomment">답변</button>
					<div id="appendwrite${relist.rpnum }"></div>
				</div>
				
		
			</c:forEach>
			
			<div id="paging">
				<c:if test="${repaging.startPage > repaging.blockSize }">
					[<a href="">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${repaging.startPage }" end="${repaging.endPage }">
					<c:if test="${repaging.currentPage == i }">
						${i }
					</c:if>
					<c:if test="${repaging.currentPage != i }">
					<a href="${conPath }/review/content.do?rnum=${reviewContent.rnum}&repageNum=${i}">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${repaging.endPage < repaging.pageCnt }">
					[<a href="">다음</a>]
				</c:if>
				
			</div>
		</c:if>
		</div>
</body>
</html>