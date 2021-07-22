<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="layout_container">
		<div id="x-div" class="recent" style="display:none;">
			<p><button id="x-btn" onclick="closeRecent(this);">최근 본 상품 보기</button></p><br>
		</div>
	
		<div id="recent" class="recent" style="display:block;">
		
			<p><button id="x-btn" onclick="closeRecent(this);">X</button></p><br>
			
			<div class="recent-title">
			최근 본 상품(${session_recent.size() })
			</div>		
						
			<c:if test="${!empty session_recent }">
				<c:forEach items="${session_recent }" var="dto">
					<div class="recent-pro">
						<a href="product_cont.do?no=${dto.getProductDTO().getPro_no()}"><img src="resources/img/upload/${dto.getProductDTO().getPro_img() }"></a>
						<br>
						<span class="recent-name"><a href="product_cont.do?no=${dto.getProductDTO().getPro_no()}">${dto.getProductDTO().getPro_name() }</a></span>
						<span class="recent-price"><fmt:formatNumber value="${dto.getProductDTO().getPro_output_price() }" /> 원</span>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				최근 본 상품이 없습니다.
				<a href="product_list.do">구경하기</a>
			</c:if>
			
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