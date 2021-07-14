<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@page import="com.spring.model.ProductRecentDTO"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function addLike(product_no, index){
	$.ajax({
		type : "post",
		url : "add_like.do",
		data : {"no":product_no},
		success : function(data) {
			if(data == 1){
				$("#like-btn-"+index).css({"color":"red"});
				return false;
			}else if(data == 2){
				$("#like-btn-"+index).css({"color":"black"});
				return false;
			}else {
				console.log("data" + data);
				alert('에이젝스 실패');
			}
		},
		error: function(request,status,error) {
			alert("통신 오류입니다.");
		}
	});
}

</script>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		<jsp:include page="../include/recent.jsp" />
			<div class="main">	
	
			<div class="search">
				<form method="post" action="product_search.do">		
					<input type="search" name="k" placeholder="${keyword }">
					<input type="submit" value="검색"> 
					</form>
			</div>
			
			<div class="category">
				<a class="category-menu" href="#">category1</a>|
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
								
								<c:if test="${dto.getLike_check() eq 0 }"><button type="button" id="like-btn-${status.index }" onclick="addLike(${dto.getPro_no() }, ${status.index })"><i class="fas fa-heart"></i></button></c:if>
								<c:if test="${dto.getLike_check() > 0 }"><button type="button" id="like-btn-${status.index }" class="like-checked" onclick="addLike(${dto.getPro_no() }, ${status.index })"><i class="fas fa-heart"></i></button></c:if>
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