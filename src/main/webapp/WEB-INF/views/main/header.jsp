<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/main/header.css" rel="stylesheet">
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div id="header">
	    <c:if test="${empty member && empty admin}">
	    	<a id="login" href="${conPath }/member/loginView.do">LOGIN</a>
	    	<a id="join" href="${conPath }/member/joinView.do">JOIN US</a>
	   		<a id="adminLogin" href="${conPath }/admin/loginView.do">ADMIN</a>
	    </c:if>
	    <c:if test="${not empty member }">
	    	<a id="calendar" href="${conPath }/calendar.do">CALENDAR</a>
		    <a id="myList" href="${conPath }/diary/myList.do?ddate=${today }">TODAY</a>
		    <a id="diary" href="${conPath }/diary/diaryList.do">DIARY</a>
	    	<a id="daily" href="${conPath }/timetable/view.do?tdate=${today }">DAILY</a>
	    	<a id="review" href="${conPath }/review/list.do">REVIEW</a>
	    	<a id="account" href="${conPath }/account/list.do">ACCOUNT</a>
		   	<a id="group" href="${conPath}/teammember/myteamList.do">GROUP</a>
	    	<a id="teamboard" href="${conPath }/teamboard/list.do">GROUP BOARD</a>
	    	<a id="friend" href="${conPath }/friend/list.do">FRIEND</a>
		   	<a id="notice" href="${conPath }/notice/list.do">NOTICE</a>
		   	<a id="qna" href="${conPath }/qna/list.do">Q&A</a>
		    <a id="mypage" href="${conPath }/member/modifyView.do">MY PAGE</a>
		    <a href="${conPath }/member/logout.do">LOGOUT</a>
	    </c:if>
	    <c:if test="${not empty admin }">
			<a id="memberList" href="${conPath }/member/memberList.do">MEMBER LIST</a>
	   		<a id="adminList" href="${conPath }/admin/list.do">ADMIN LIST</a>
		   	<a id="notice" href="${conPath }/notice/list.do">NOTICE</a>
		   	<a id="qna" href="${conPath }/qna/list.do">Q&A</a>
			<a href="${conPath }/admin/logout.do">LOGOUT</a>
	    </c:if>
	</div>
</body>
</html>