<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<title>로그인</title>
</head>
<body>

	<!-- sns 로그인 개발 중 : sns_login.do -->

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
					<h4><a href="${url }">네이버 연동</a></h4>
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>