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
<script type="text/javascript">

function resetCart() {
	if(confirm("장바구니를 비우시겠습니까?")){
        location.href="cart_reset.do";
    }
};

</script>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			<div class="main">			
			
				<div class="history-title">
				장바구니<c:if test="${!empty cList }">(${cList.size() })</c:if>
				</div>
				
				<div class="history-wrap">
					<hr>
					<ul>
					
					<li>
						<div class="history">
							<input type="checkbox">
							
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
					
					<c:if test="${!empty cList }">
					<c:forEach items="${cList }" var="dto" varStatus="status">
						<li>
							<div class="history">
								<input type="checkbox">
								<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}"><img src="resources/img/product/${pList[status.index].getPro_img() }"></a>
								
								<div class="pro-content">
									<span>${pList[status.index].getPro_tag() }</span><br>
									<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}">${pList[status.index].getPro_name() }</a>
								</div>
								
								<div class="pro-btn">
									
									<button onclick="count(plus)">+</button>
									<input class="cart_amount" name="cart_amount" placeholder="${dto.getCart_amount() }">
									<button onclick="count(minus)">-</button>
									개
									
								</div>
								
								<div class="pro-price">
									<fmt:formatNumber value="${pList[status.index].getPro_output_price() }" /> 원
								</div>
								
								<div class="pro-cancel">
									<button onclick="#">X</button>
								</div>
							</div>
						</li>
						</c:forEach>
						
						
						<li>
							<div class="price-amount-wrap">
								<span class="pro-amount">상품 합계</span>
								<span class="price-amount">[총 금액] 원</span>
							</div>
						</li>
						</c:if>	
						
						<c:if test="${empty cList }">
						<li>
							장바구니가 비었습니다.
						</li>
						</c:if>
					</ul>
					<c:if test="${!empty cList }">
						<button class="order-btn" onclick="#">선택상품 삭제</button>
						<button class="order-btn" onclick="resetCart();">전체상품 삭제</button>
					</c:if>
					<button class="order-btn" onclick="#">선택상품주문하기</button>
					<button class="order-btn" onclick="#">전체상품주문하기</button>
					
				</div>
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>