<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.spring.model.ProductDTO"%>
<%@page import="com.spring.model.ProductDAOImpl"%>
<%@page import="com.spring.model.ProductDAO"%>
<%@page import="com.spring.model.ProductRecentDAOImpl"%>
<%@page import="com.spring.model.ProductRecentDAO"%>
<%@page import="com.spring.model.ProductRecentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

	<div class="layout_container">
		<div id="x-div" class="recent">
			<p><button id="x-btn" onclick="closeRecent(this);">최근 본 상품 보기</button></p><br>
		</div>
	
		<div id="recent" class="recent">
		
			<p><button id="x-btn" onclick="closeRecent(this);">X</button></p><br>
			
			<div class="recent-title">
			최근 본 상품(수)
			</div>		
						
			<div class="recent-pro">
				<img src="#">
				<br>
				<span class="recent-name"><a href="#">[상품이름]</a></span>
				<span class="recent-price">[가격]</span>
			</div>
			
			<div class="recent-pro">
				<img src="#">
				<br>
				<span class="recent-name"><a href="#">[상품이름]</a></span>
				<span class="recent-price">[가격]</span>
			</div>
			
			<div class="recent-pro">
				<img src="#">
				<br>
				<span class="recent-name"><a href="#">[상품이름]</a></span>
				<span class="recent-price">[가격]</span>
			</div>
			
		</div>
	</div>
	
</body>
</html>