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
<link href="${conPath }/css/friend/friendList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('form[name="frm2"]').submit(function() {
			$.ajax({
				url : '${conPath}/alert/read.do',
				type : 'get',
				dataType : 'html',
				data : $('form[name="frm2"]').serialize(),
				success : function(data){
					$('.alert_list').html(data);
					$('.alert_num').text('0');
				}
			});
			return false;
		});
		
		$('input[name="mname"]').keyup(function() {
			var mname = $('input[name="mname"]').val();
			$.ajax({
				url : '${conPath}/friend/search.do',
				data : 'mname=' + mname,
				type : 'get',
				dataType : 'html',
				success : function(data) {
					$('#listResult').html(data);
				}
			});
		});

		$('.unfollow').click(function() {
			var id = $(this).attr('id');
			var answer = confirm('정말 해당 친구를 언팔로우하시겠습니까?');
			if (answer == true) {
				location.href = '${conPath}/friend/unfollow.do?alcode=2&fid='+ id;
			} else {
				return false;
			}
		});

		$('.follow').click(function() {
			var id = $(this).attr('id');
			var answer = confirm('정말 해당 친구를 팔로우하시겠습니까?');
			if (answer == true) {
				location.href = '${conPath}/friend/follow.do?alcode=1&fid='+ id;
			} else {
				return false;
			}
		});
		
		var pageCnt = Number('${append.pageCnt}');
		var totCnt = Number('${append.totCnt}');
		if(totCnt<=5){
			$('.appendAlert').css('display','none');
		}
		$('.appendAlert').click(function() {
			pageNum = Number($('.pageNum').last().val());
			if(isNaN(pageNum)){
				pageNum=1;
			}
			$.ajax({
				url : '${conPath}/alert/append.do',
				type : 'get',
				dataType : 'html',
				data : {"pageNum":(pageNum+1)},
				success : function(data) {
					$('#appendDiv').append(data);
					pageNum = Number($('.pageNum').last().val());
					if(pageCnt <= pageNum){
						$('.appendAlert').css('display','none');
					}
				}
			});
		});

		$('#friend').addClass('nowIndex');
});
</script>
</head>
<body>
	<c:if test="${followResult eq 1 }">
		<script>
			alert('팔로우 성공');
		</script>
	</c:if>
	<c:if test="${followResult eq 0 }">
		<script>
			alert('팔로우 실패');
		</script>
	</c:if>
	<c:if test="${unfollowResult eq 1 }">
		<script>
			alert('언팔로우 성공');
		</script>
	</c:if>
	<c:if test="${unfollowResult eq 0 }">
		<script>
			alert('언팔로우 실패');
		</script>
	</c:if>
	<div id="main_wrap">
		<div id="wrap">
			<div id="list_wrap">
				<div id="search_wrap">
					<a href="${conPath }/friend/findView.do">친구찾기</a>
				</div>
				<div id="sub_title">
					<div id="following">팔로잉</div>
					<div id="follower">팔로워</div>
				</div>
				<div id="myList">
					<form name="frm1">
						<p>
							친구검색 <input type="text" name="mname" placeholder="닉네임을 입력하세요">
						</p>
					</form>
					<div id="listResult">
						<table>
							<c:if test="${empty friends }">
								<tr>
									<td>등록된 친구가 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${not empty friends }">
								<c:forEach items="${friends }" var="friend">
									<tr>
										<td>${friend.mname }(${friend.fid })</td>
										<td>
											<button id="${friend.fid }" class="unfollow">unfollow</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
				<div id="followMe" style="overflow:auto;">
					<table>
						<c:if test="${empty follows }">
							<tr>
								<td>검색결과가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${not empty follows }">
							<c:forEach items="${follows }" var="follow">
								<tr>
									<td>${follow.mname }(${follow.mid })</td>
									<td>
									<c:if test="${follow.existent eq 1 }">
										<button id="${follow.mid }" class="unfollow">unfollow</button>
									</c:if> <c:if test="${follow.existent eq 0 }">
										<button id="${follow.mid }" class="follow">follow</button>
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div id="alert_icon">
					<label for="checkbox"><span class="alert_num">${alertNum }</span></label>
					<input type="checkbox" id="checkbox">
					<div class="alert_list">
						<form name="frm2">
							<table>
								<caption><input type="submit" value="모든알림읽음" class="btn"></caption>
								<c:if test="${empty alerts }">
									<tr>
										<td>알림이 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${not empty alerts }">
									<c:forEach items="${alerts }" var="alert">
										<tr>
											<td
												<c:if test="${alert.alcheck eq 0 }">
													style="font-weight : bold;"
												</c:if>
											>
												<input type="hidden" name="alno" value="${alert.alno }">
												${alert.midname }(${alert.mid })님이 ${alert.fidname }(${alert.fid })님을 ${alert.codename }하였습니다<br>
												<fmt:formatDate value="${alert.aldate }" pattern="MM월 dd일" />
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</form>
						<div id="appendDiv"></div>
						<div class="appendBtn"><button class="appendAlert">더보기</button></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../main/header.jsp"/>
	</div>
</body>
</html>