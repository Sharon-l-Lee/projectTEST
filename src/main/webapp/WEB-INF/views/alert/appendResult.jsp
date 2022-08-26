<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<table>
		<c:forEach items="${alerts }" var="alert">
			<tr>
				<td 
					<c:if test="${alert.alcheck eq 0 }">
						style="font-weight : bold;"
					</c:if>
				>
					<input type="hidden" name="alno" value="${alert.alno }">
					${alert.midname }(${alert.mid })님이 ${alert.fidname }(${alert.fid })님을 ${alert.codename }하였습니다
					<br><fmt:formatDate value="${alert.aldate }" pattern="MM월 dd일"/> 
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="pageNum" class="pageNum" value="${pageNum }">
</body>
</html>