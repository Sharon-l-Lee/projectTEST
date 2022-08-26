
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

<link href="${conPath }/css/review/rcontent.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		//인덱스
		$(document).ready(function() {
			$('#review').addClass('nowIndex');
		});

		//댓글 쓰기

		$('#write').click(function() {
			//$("#wform").serialize()

			$.ajax({
				type : 'post', // 타입 (get, post, put 등등)
				url : '${conPath}/reply/write.do', // 요청할 서버url
				dataType : 'html', // 데이터 타입 (html, xml, json, text 등등)
				data : $("#wform").serialize(),
				success : function(data) { // 결과 성공 콜백함수
					$("#rpcontent").val("");

				},

			})

		});

		//댓글 수정

		$('.modifyview').click(function() {
			var rpnum = $(this).attr('id');
			var rnum = $('#rnum' + rpnum).text();
			var rpcontent = $('#rpcontent' + rpnum).text();

			$.ajax({
				type : 'get',
				url : '${conPath}/reply/modify.do',
				dataType : 'html',
				data : {
					'rpnum' : rpnum,
					'rpcontent' : rpcontent,
					'rnum' : rnum
				},
				success : function(data) {
					$('#append' + rpnum).append(data);
					$('#rpcontent' + rpnum).hide();

				},

			})
		});

		//대댓글
		$('.recomment').click(function() {
			var rpnum = $(this).attr('id');
			var rnum = $('#rnum' + rpnum).text();

			$.ajax({
				type : 'get',
				url : '${conPath}/reply/comment.do',
				dataType : 'html',
				data : {
					'rpnum' : rpnum,
					'rnum' : rnum
				},
				success : function(data) {
					$('#appendwrite' + rpnum).append(data);

				},

			})
		});

	});
</script>
</head>
<body>
	<div id="main_wrap">
		<div id="wrap">
			<h1>REVIEW</h1>
			<div id="content_wrap">
				<div class="rphoto">
					<c:if test="${empty reviewContent.rfilename }">
						<div>
							<img src="${conPath }/img/reviewNoImg.PNG">
						</div>
					</c:if>
					<c:if test="${not empty reviewContent.rfilename }">
						<div>
							<img
								src="${conPath }/ReviewImgUpload/${reviewContent.rfilename }"
								style="width: 270px; height: 300px;">
						</div>
					</c:if>
				</div>
				<div class="titles">
					<table>
						<tr>
							<th>제목</th>
							<td>${reviewContent.rtitle }</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>${reviewContent.rrdate }</td>
						</tr>
						<tr>
							<th>공개범위</th>
							<c:if test="${reviewContent.rstatus  eq 0}">
								<td>전체공개</td>
							</c:if>
							<c:if test="${reviewContent.rstatus  eq 1}">
								<td>친구공개</td>
							</c:if>
							<c:if test="${reviewContent.rstatus  eq 2}">
								<td>나만보기</td>
							</c:if>
						</tr>
						<tr>
							<th>태그</th>
							<c:if test="${not empty tags }">
								<td><c:forEach var="t" items="${tags }">
										<span>#${t.hname }</span>
									</c:forEach></td>
							</c:if>
							<c:if test="${empty tags }">
								<td>태그가 등록되지 않았습니다</td>
							</c:if>
						</tr>
						<tr>
							<td colspan="4">
								<button class="rbtn"
									onclick="location.href='${conPath}/review/modify.do?rnum=${reviewContent.rnum}'">수정</button>
								<button class="rbtn"
									onclick="location.href='${conPath}/review/delete.do?rnum=${reviewContent.rnum}'">삭제</button>
								<button class="rbtn"
									onclick="location.href='${conPath}/review/list.do'">목록</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="contents">${reviewContent.rcontent }</div>

			</div>
			<%-- <button
		onclick="location.href='${conPath}/review/replylist.do?rnum=${reviewContent.rnum}'">댓글목록</button> --%>
			<div id="comment">
				<div id="cmtwrite">
					<%-- 	<form action="${conPath }/review/replywrite.do" method="post"> --%>
					<form name="wform" id="wform" method="post">
						<input type="hidden" name="rnum" value="${reviewContent.rnum }">
						<textarea rows="5" cols="70" id="rpcontent" name="rpcontent"></textarea>

						<button id="write" class="cbtn">작성</button>

					</form>
					<!-- 	</form> -->
				</div>
				<div id="cmtlist"></div>
				<div id="cmt">

					<c:if test="${empty replylist }">
						<div class="reply">등록된 댓글이 없습니다</div>
					</c:if>
					<c:if test="${not empty replylist }">
						<c:forEach items="${replylist }" var="relist">
							<c:if test="${relist.rpindent eq 1 }">
								<div class="idt1">

									<c:if test="${relist.rpmention != null}">
										<div>@ ${relist.rpmention }</div>
									</c:if>
									<div class="reply">

										<div id="${relist.rnum }" style="display: none;">${relist.rnum }</div>
										<div id="rnum${relist.rpnum }" style="display: none;">${relist.rnum }</div>
										<div id="">작성자 : ${relist.mname }</div>
										<div id="append${relist.rpnum }"></div>
										<div id="rpcontent${relist.rpnum }">${relist.rpcontent }

										</div>
										<div id="">작성일: ${relist.rpdate }</div>



										<button id="${relist.rpnum }" class="modifyview cbtn">수정</button>
										<!-- 
						onclick="location.href='${conPath}/review/replymodify.do?rpnum=${relist.rpnum}'"
						onclick="location.href='${conPath}/review/replycomment.do?rpnum=${relist.rpnum}'" -->
										<button
											onclick="location.href='${conPath}/reply/delete.do?rpnum=${relist.rpnum}&rnum=${relist.rnum }'"
											class="cbtn">삭제</button>
										<button id="${relist.rpnum }" class="recomment cbtn">답변</button>
										<div id="appendwrite${relist.rpnum }"></div>
									</div>
								</div>
							</c:if>

							<c:if test="${relist.rpindent eq 0 }">

								<div class="idt0">
									<c:if test="${relist.rpmention != null}">
										<div>@ ${relist.rpmention }</div>
									</c:if>
									<div class="reply">

										<div id="${relist.rnum }" style="display: none;">${relist.rnum }</div>
										<div id="rnum${relist.rpnum }" style="display: none;">${relist.rnum }</div>
										<div id="">작성자 : ${relist.mname }</div>
										<div id="append${relist.rpnum }"></div>
										<div id="rpcontent${relist.rpnum }">${relist.rpcontent }

										</div>
										<div id="">작성일: ${relist.rpdate }</div>



										<button id="${relist.rpnum }" class="modifyview cbtn">수정</button>
										<!-- 
						onclick="location.href='${conPath}/review/replymodify.do?rpnum=${relist.rpnum}'"
						onclick="location.href='${conPath}/review/replycomment.do?rpnum=${relist.rpnum}'" -->
										<button
											onclick="location.href='${conPath}/reply/delete.do?rpnum=${relist.rpnum}&rnum=${relist.rnum }'"
											class="cbtn">삭제</button>
										<button id="${relist.rpnum }" class="recomment cbtn">답변</button>
										<div id="appendwrite${relist.rpnum }"></div>
									</div>
								</div>
							</c:if>

						</c:forEach>
						<div id="paging">
							<c:if test="${repaging.startPage > repaging.blockSize }">
								[<a href="">《 </a>]
							</c:if>
							<c:forEach var="i" begin="${repaging.startPage }"
								end="${repaging.endPage }">
								<c:if test="${repaging.currentPage == i }">
									●
								</c:if>
								<c:if test="${repaging.currentPage != i }">
									<a
										href="${conPath }/review/content.do?rnum=${reviewContent.rnum}&repageNum=${i}">○</a>
								</c:if>
							</c:forEach>
							<c:if test="${repaging.endPage < repaging.pageCnt }">
								[<a href="">》</a>]
							</c:if>

						</div>
					</c:if>
				</div>


			</div>
		</div>
		<jsp:include page="../main/header.jsp" />
	</div>
</body>
</html>