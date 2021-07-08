<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="main">			
			
				<div class="history-title">
				장바구니([수])
				</div>
				
				<div class="history-wrap">
					<hr>
					<ul>
						<li>
							<div class="history">
								<a href="#"><img src="#"></a>
								
								<div class="pro-content">
									<span>[태그]</span><br>
									<a href="#">[상품명]</a>
								</div>
								
								<div class="pro-price">
									[상품가격] 원
								</div>
								
								<div class="pro-btn">
									
									<input type="button" value="+">
									1
									<input type="button" value="-">
									개
									
								</div>
								
								<div class="pro-cancel">
									<button>X</button>
								</div>
							</div>
						</li>
						
						<li>
							<div class="price-amount-wrap">
								<span class="pro-amount">상품 합계</span>
								<span class="price-amount">[총금액] 원</span>
							</div>
						</li>					
					</ul>
					
					<button class="order-btn">주문하기</button>
					
				</div>
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>