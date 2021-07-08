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
				
				
				<%-- 상단 제품 소개 및 주문 --%>
				<div class="product-cont">
					<div class="cont-photo-wrap">
						<img class="cont-photo" src="">
						
						<div class="cont-photo-mini">
							<img src="">
							<img src="">
							<img src="">
						</div>
					</div>
					
					<div class="cont-info">
						<span class="cont-info-title">[상품명]</span><br>
						<span class="cont-info-price">[가격] 원</span>
						
						<div class="cont-amount">
							<span>수량</span>
							<button>-</button>
							1
							<button>+</button>
						</div>
						
						<button>구매하기</button>
						<button>장바구니에 담기</button>
					</div>
				</div>
				
				
				<%-- 상품 상세설명 --%>
				<div class="product-content">
					<span class="content-category">상품 설명</span>
					<span class="content-category">후기([후기 수])</span>
					<span class="content-category">질문([문의 수])</span>
					
					<hr>
					
					
				</div>
				
				<div class="content-detail">
					[상품 상세설명]
				</div>
				
				
				<%-- 리뷰 --%>
				<div class="cont-board">
					<span class="table-title">후기</span>
					<span class="review-star">[별점 평균] / 5</span>
					<span class="review-number">([후기 수]개 후기)</span>
					
					<div class="photo-only">
						<input type="checkbox">
						사진 후기만 보기
					</div>
					
					<hr>
					
					<ul>
						<li>
							<div class="review">	
								<div class="review-wrap">	
									<span class="personal-star">[별점]</span> 
									<span class="mem-id">[회원 아이디]</span> <br>
									<span class="review-cont">[회원 후기]</span>
								</div>
								
								<img src="#">
							</div>
						</li>
					</ul>
					
					<button class="write">후기 쓰기</button>
					<br>
					
					<%-- pagination --%>
					<div class="cont-pagination">
						<button>1</button>
						<button>2</button>
						<button>3</button>
					</div>
				</div>
				
				
				<%-- 질문 --%>
				<div class="cont-board">
					<span class="table-title">질문</span>
					
					<hr>
					
					<ul>
						<li>
							<div class="qna-bar">
								<span class="qna-no">번호</span>
								<span class="qna-title">제목</span>
								<span class="qna-writer">글쓴이</span>
								<span class="qna-regdate">작성일자</span>
							</div>
						</li>
					
						<li>
							<div class="qna">	
								<span class="qna-no">[번호]</span>
								<span class="qna-title">[제목]</span>
								<span class="qna-writer">[글쓴이]</span>
								<span class="qna-regdate">[작성일자]</span>
								
							</div>
						</li>
					</ul>
					
					<button class="write">질문 쓰기</button>
					<br>
					
					<%-- pagination --%>
					<div class="cont-pagination">
						<button>1</button>
						<button>2</button>
						<button>3</button>
					</div>
				</div>
				
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>