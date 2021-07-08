<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div>
		<c:set var="list" value="${List }" />
		<c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
				<a href="<%=request.getContextPath() %>/member_home.do?id=${dto.getMem_id() }">[마이페이지 테스트]</a>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>