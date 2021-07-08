<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<title>Member</title>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			<c:set var="mem" value="${cont }" />
			<div class="member_header">
				<ul>
					<li><i class="fas fa-user-circle"></i></li>
					<li>${mem.getMem_id() }</li>
					<li>적립금</li>
					<li>쿠폰</li>
				</ul>
			</div>
			
			<div class="nav_menu">
				<ul>
					<li>주문내역</li>
					<li>문의내역</li>
					<li>정보관리</li>
				</ul>
			</div>
			
			<div class="member_order">
			
			
			</div>
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>