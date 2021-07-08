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
		<jsp:include page="../include/header.jsp" />
		<jsp:include page="../include/recent.jsp" />
			<div class="main">	
			
			<div class="category">
				<a class="category-menu" href="#">category1</a>|
				<a class="category-menu" href="#">category2</a>|
				<a class="category-menu" href="#">category3</a>|
				<a class="category-menu" href="#">category4</a>
			</div>
			
			<c:if test="${!empty List }">
				<c:forEach items="${List }" var="dto">
					<div class="product">
							<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}"><img src="resources/img/product/${dto.getPro_img() }"></a>
							<div class="product-info">
								<a class="pro-tag" href="#">${dto.getPro_tag() }</a><br>
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
					<a href="product_list.do?page=1">◀◀</a>
	   				<a href="product_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
				</c:if>
				
				<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
			      <c:if test="${i == page.getPage() }">
			         <b><a href="product_list.do?page=${i }">${i }</a></b>
			      </c:if>
			      
			      <c:if test="${i != page.getPage() }">
			         <a href="product_list.do?page=${i }">${i }</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${page.getEndBlock() < page.getAllPage() }">
			      <a href="product_list.do?page=${page.getEndBlock() +1 }">▶</a>
			      <a href="product_list.do?page=${page.getAllPage() }">▶▶</a>
			   </c:if>
				
			</div>
		
				
			
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>