<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<a href="#"><img src="#"></a>
								
								<div class="pro-content">
									<span>[태그]</span><br>
									<a href="#">[상품명]</a>
								</div>
								
								<div class="pro-price">
									[상품가격] 원
								</div>
								
								<div class="pro-btn">
									<button>장바구니 담기</button><br>
									<button>결제하기</button>
								</div>
								
								<div class="pro-cancel">
									<button>X</button>
								</div>
							</div>
						</li>
					
					</ul>
				
				</div>
			
			
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>