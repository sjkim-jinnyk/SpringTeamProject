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
<title>울퉁불퉁's 검색 - ${keyword }</title>
</head>
<body>
	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		 
			<div class="about_header">
				<span>SEARCH PRODUCT</span>
				<img src="resources/img/main/orange_bg.jpeg">
			</div>
			
			<div class="main">	
			
			<div class="search-box">
				<form method="post" action="product_search.do" >	
					<i class="fas fa-search"></i>
					<input id="search" class="search" type="search" name="k" placeholder="<c:if test="${!empty List }"> '${keyword }' 에 대한 통합 검색 결과입니다.</c:if><c:if test="${empty List }"> '${keyword }' 에 해당하는 상품 검색 결과가 없습니다.</c:if>">
				</form>
			</div>
			
			<div class="product-wrapper">
			<c:if test="${!empty List }">
				<c:forEach items="${List }" var="dto">
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
			</div>
			
			<%-- Pagination --%>	
			<div class="pagination">
				<c:if test="${page.getPage() > page.getBlock() }">
					<span class="page-btn"><a href="product_search.do?page=1&k=${keyword}">◀◀</a></span>
	   				<span class="page-btn"><a href="product_search.do?page=${Paging.getStartBlock() - 1 }&k=${keyword}">◀</a></span>
				</c:if>
				
				<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
			      <c:if test="${i == page.getPage() }">
			         <span class="page-selected"><a href="product_search.do?page=${i }&k=${keyword}">${i }</a></span>
			      </c:if>
			      
			      <c:if test="${i != page.getPage() }">
			         <span class="page-btn"><a href="product_search.do?page=${i }&k=${keyword}">${i }</a></span>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${page.getEndBlock() < page.getAllPage() }">
			      <span class="page-btn"><a href="product_search.do?page=${page.getEndBlock() +1 }&k=${keyword}">▶</a></span>
			      <span class="page-btn"><a href="product_search.do?page=${page.getAllPage() }&k=${keyword}">▶▶</a></span>
			   </c:if>
				
			</div>
		
				<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
			
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

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