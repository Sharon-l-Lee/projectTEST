<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${replylist }" var="relist">
			번호 : ${relist. rpnum }
			글번호 : ${relist.rnum }
			작성자 : ${relist.mname }
			내용: ${relist.rpcontent }
			작성일: ${relist.rpdate }
		</c:forEach>
</body>
</html>