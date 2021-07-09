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
				장바구니<c:if test="${!empty cList }">(${cList.size() })</c:if>
				</div>
				
				<div class="history-wrap">
					<hr>
					<ul>
					
					<c:if test="${!empty cList }">
					<c:forEach items="${cList }" var="dto" varStatus="status">
						<li>
							<div class="history">
								<input type="checkbox">
								<span class="cart-no"></span>
								<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}"><img src="resources/img/product/${pList[status.index].getPro_img() }"></a>
								
								<div class="pro-content">
									<span>${pList[status.index].getPro_tag() }</span><br>
									<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}">${pList[status.index].getPro_name() }</a>
								</div>
								
								<div class="pro-price">
									<fmt:formatNumber value="${pList[status.index].getPro_output_price() }" /> 원
								</div>
								
								<div class="pro-btn">
									
									<input type="button" value="+">
									<input name="amount" value="${dto.getCart_amount() }">
									<input type="button" value="-">
									개
									
								</div>
								
								<div class="pro-cancel">
									<button onclick="#">X</button>
								</div>
							</div>
						</li>
						</c:forEach>
						</c:if>	
						
						<li>
							<div class="price-amount-wrap">
								<span class="pro-amount">상품 합계</span>
								<span class="price-amount">[총 금액] 원</span>
							</div>
						</li>
					</ul>
					<button class="order-btn" onclick="#">장바구니 비우기</button>
					<button class="order-btn" onclick="#">선택상품 삭제</button>
					<button class="order-btn" onclick="#">전체상품 삭제</button>
					<button class="order-btn" onclick="#">주문하기</button>
					
				</div>
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>