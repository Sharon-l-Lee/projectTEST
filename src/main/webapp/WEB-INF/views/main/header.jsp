<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<a href="${conPath }/member/memberList.do">회원목록</a>
    <c:if test="${not empty member }">
	    <a href="${conPath }/member/modifyView.do">정보수정</a>
    	<a href="${conPath }/member/logout.do">로그아웃</a>
    	<a href="${conPath }/qna/list.do">QNA</a>
    	<a href="${conPath }/friend/list.do">친구</a>
    	<a href="${conPath }/alert/list.do">알림(${alertCount })</a>
    </c:if>
    <c:if test="${empty member }">
    	<a href="${conPath }/member/joinView.do">회원가입</a>
    	<a href="${conPath }/member/loginView.do">로그인</a>
    </c:if>
    <a href="${conPath }/calendar.do">캘린더</a>
   	<a href="${conPath }/review/list.do">감상문</a>
   	<a href="${conPath }/teamboard/list.do">팀 보드</a>
   	<a href="${conPath}/teammember/myteamList.do">나의 그룹(로그인 후)</a>
   	<a href="${conPath }/admin/loginView.do">관리자 로그인</a>
   	<a href="${conPath }/timer/setting.do" onclick="window.open(this.href,'_blank', 'width=630, height=400'); return false">타이머</a>
   	<a href="${conPath }/notice/list.do">공지사항</a>
    <a href="${conPath }/timetable/view.do">일 캘린더</a>
    <a href="${conPath }/diary/diaryList.do">일기목록</a>
    <a href="${conPath }/account/list.do">가계부</a>

</body>
</html>