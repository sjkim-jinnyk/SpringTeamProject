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
<title>Insert title here</title>
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			<div class="main">			
				
				<div class="history-title">
				최근 본 상품
				</div>
				
				<div class="history-wrap">
					<hr>
					<ul>
						<li>
							<div class="history">
								<div class="pro-content">
									상품 정보
								</div>
								
								<div class="pro-btn">
									수량
								</div>
								
								<div class="pro-price">
									가격
								</div>
							</div>
						</li>
						
						<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
							<li>
							<form method="post">
								<input type="hidden" name="product_no" value="${dto.getProductDTO().getPro_no() }">
								<div class="history">
									<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getProductDTO().getPro_no()}"><img src="resources/img/upload/${dto.getProductDTO().getPro_img() }"></a>
									
									<div class="pro-content">
										<c:forEach items="${dto.getProductDTO().getPro_tags() }" var="tags">
											<a class="cont-info-tag" href="search_tag.do?k=${tags }">${tags }</a> 
										</c:forEach><br>
										<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getProductDTO().getPro_no()}">${dto.getProductDTO().getPro_name() }</a>
									</div>
									
									<div class="pro-price">
										<fmt:formatNumber value="${dto.getProductDTO().getPro_output_price() }" /> 원
									</div>
									
									<div class="pro-btn">
										<input type="submit" value="구매하기" formaction="#">
										<input type="submit" value="장바구니에 담기" formaction="add_cart.do">
									</div>
									
									<div class="pro-cancel">
										<button onclick="location.href='recent_delete.do?no=${dto.getProductDTO().getPro_no() }'">X</button>
									</div>
								</div>
							</form>
							</li>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty list }">
							<li>
								최근 본 상품이 없습니다.
							</li>
						</c:if>
					</ul>
				
				</div>
			
			
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>