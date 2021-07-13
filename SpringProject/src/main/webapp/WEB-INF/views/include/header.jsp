<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/include.css">
<title>Insert title here</title>
</head>
<body>

	<div class="layout_container">
		
		<div class="header_desktop header">
			
			<div class="left_wrap">
				<div class="left">
					<a href="<%=request.getContextPath()%>/about.do">ABOUT</a>
					<a href="<%=request.getContextPath()%>/product_list.do">SHOP</a>
					<a href="<%=request.getContextPath()%>/review_list.do">REVIEW</a>
				</div>
			</div>
			
			<div class="center">
				<a href="<%=request.getContextPath()%>/main.do" class="site_logo">울퉁불퉁's</a>
			</div>
			
			<div class="right_wrap">
				<div class="right">
					<a href="<%=request.getContextPath()%>/search_list.do">검색</a>
					
					<c:if test="${empty userId }">
						<a href="<%=request.getContextPath()%>/login.do">LOGIN</a>
					</c:if>
					
					<c:if test="${!empty userId }">
						<a href="<%=request.getContextPath()%>/logout.do">LOGOUT</a>
						<c:set var="id" value="${userId }"  />
							${id }님 환영합니다.
					</c:if>
					
					<a href="<%=request.getContextPath()%>/cart.do">장바구니</a>
				</div>
			</div>
			
		</div>
		
	</div>

</body>
</html>