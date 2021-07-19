<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
	
			<div class="search">
				<form method="post" action="product_search.do">		
					<input type="search" name="k" placeholder="${keyword }">
					<input type="submit" value="검색"> 
					</form>
			</div>
			
			<div class="category">
				<a class="category-menu" href="product_insert.do">상품등록</a>|
				<a class="category-menu" href="#">category2</a>|
				<a class="category-menu" href="#">category3</a>|
				<a class="category-menu" href="#">category4</a>
			</div>
			
			<c:if test="${!empty List }">
				<c:forEach items="${List }" var="dto" varStatus="status">
					<div class="product">
							<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}"><img src="resources/img/product/${dto.getPro_img() }"></a>
							
							<div class="product-info">
							
								<c:forEach items="${dto.getPro_tags() }" var="tags">
									<a class="pro-tag" href="search_tag.do?k=${tags }">${tags }</a> 
								</c:forEach><br>
								
								<a class="pro-name" href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}">${dto.getPro_name() }</a><br>
								<span class="pro-price">${dto.getPro_output_price() } 원</span>
							</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty List }">
				상품 준비 중입니다.
			</c:if>
			
			
			<%-- Pagination --%>	
			<div class="pagination">
				<c:if test="${page.getPage() > page.getBlock() }">
					<a href="admin_product_list.do?page=1">◀◀</a>
	   				<a href="admin_product_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
				</c:if>
				
				<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
			      <c:if test="${i == page.getPage() }">
			         <b><a href="admin_product_list.do?page=${i }">${i }</a></b>
			      </c:if>
			      
			      <c:if test="${i != page.getPage() }">
			         <a href="admin_product_list.do?page=${i }">${i }</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${page.getEndBlock() < page.getAllPage() }">
			      <a href="admin_product_list.do?page=${page.getEndBlock() +1 }">▶</a>
			      <a href="admin_product_list.do?page=${page.getAllPage() }">▶▶</a>
			   </c:if>
				
			</div>
		
				
			
			</div>
			
		</div>
	</div>
	
</body>
</html>