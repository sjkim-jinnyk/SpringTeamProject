<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="resources/css/main.css?after">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>울퉁불퉁's</title>
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		
			<div class="about_header">
				<span>product list</span>
				<img src="resources/img/main/orange_bg.jpeg">
			</div>
			<div class="main">	
			
				<div class="page-wrapper">
					<div class="category">
						<span class="category-title">Department</span>
						<ul>
							<li><a class="category-menu <c:if test="${page.getNo() eq 0 }">cate-selected</c:if>" href="product_list.do">전체 상품</a></li>
						
							<c:if test="${!empty cList }">
								<c:forEach items="${cList }" var="dto">
									<li><a class="category-menu 
										<c:if test="${dto.getCate_no() eq page.getNo() }">cate-selected</c:if>
									 " href="product_list.do?no=${dto.getCate_no() }">${dto.getCate_name() }</a></li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
					
					<div class="product-wrapper">			
						<c:if test="${!empty List }">
							<c:forEach items="${List }" var="dto" varStatus="status">
								<div class="product">
										<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}"><img src="resources/img/upload/${dto.getPro_img() }"></a>
										
										<div class="product-info">
										
											<c:forEach items="${dto.getPro_tags() }" var="tags">
												<a class="cart-tag" href="search_tag.do?k=${tags }">${tags }</a> 
											</c:forEach><br>
											
											<a class="pro-name" href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}">${dto.getPro_name() }</a><br>
											<span class="pro-price">${dto.getPro_output_price() } 원</span>
											
											<div class="like-wrapper">
												<c:if test="${dto.getLike_check() eq 0 }"><button class="like-btn" type="button" id="like-btn-${status.index }" onclick="likeCheck(${dto.getPro_no() }, ${status.index })"><i class="fas fa-heart"></i></button></c:if>
												<c:if test="${dto.getLike_check() > 0 }"><button type="button" id="like-btn-${status.index }" class="like-btn like-checked" onclick="likeCheck(${dto.getPro_no() }, ${status.index })"><i class="fas fa-heart"></i></button></c:if>
											</div>
											
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
								<span class="page-btn"><a href="product_list.do?page=1&no=${page.getNo() }">◀◀</a></span>
				   				<span class="page-btn"><a href="product_list.do?page=${Paging.getStartBlock() - 1 }&no=${page.getNo() }">◀</a></span>
							</c:if>
							
							<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
						      <c:if test="${i == page.getPage() }">
						         <span class="page-selected"><a href="product_list.do?page=${i }&no=${page.getNo() }">${i }</a></span>
						      </c:if>
						      
						      <c:if test="${i != page.getPage() }">
						         <span class="page-btn"><a href="product_list.do?page=${i }&no=${page.getNo() }">${i }</a></span>
						      </c:if>
						   </c:forEach>
						   
						   <c:if test="${page.getEndBlock() < page.getAllPage() }">
						      <span class="page-btn"><a href="product_list.do?page=${page.getEndBlock() +1 }&no=${page.getNo() }">▶</a></span>
						      <span class="page-btn"><a href="product_list.do?page=${page.getAllPage() }&no=${page.getNo() }">▶▶</a></span>
						   </c:if>
						</div>	
					
					</div><%-- product-wrapper end --%>
				</div><%-- page-wrapper end --%>
				
				<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
				
			</div><%-- main end --%>
		<jsp:include page="../include/footer.jsp" />

</body>
<script type="text/javascript" src="resources/js/product.js"></script>
<script type="text/javascript">
function likeCheck(product_no, index){
	if('${session_id}' == ''){
		alert('로그인 후 사용가능합니다.');
		window.open("login_popup.do", "로그인", "_blank");
		return;
	}else{
		addLikey(product_no, index);
	}
}
</script>
</html>