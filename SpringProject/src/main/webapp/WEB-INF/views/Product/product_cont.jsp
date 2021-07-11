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



</script>
<body>
	
	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			<div class="main">			
				
				
				<%-- 상단 제품 소개 및 주문 --%>
				<c:set var="dto" value="${cont }" />
				<c:if test="${!empty cont }">
					<div class="product-cont">
						<div class="cont-photo-wrap">
							<img class="cont-photo" src="resources/img/product/${dto.getPro_img() }">
							
							<div class="cont-photo-mini">
								<img src="">
								<img src="">
								<img src="">
							</div>
						</div>
						
						<div class="cont-info">
						<form method="post">
							<input type="hidden" name="product_no" value="${dto.getPro_no() }"> 
							<span class="cont-info-title">${dto.getPro_name() }</span><br>
							<span class="cont-info-price"><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원</span>
							
							<div class="cont-amount">
								<span>수량</span>
								<button onclick="count('m', this);" value="-">-</button>
								<input type="text" class="cart_amount" name="cart_amount" value="1">
								<button onclick="plus();" value="+">+</button>
							</div>
							
							<input type="submit" value="구매하기" formaction="#">
							<input type="submit" value="장바구니에 담기" formaction="add_cart.do">
							</form>
						</div>
					</div>
				
				
				
				<%-- 상품 상세설명 --%>
				<div class="product-content">
					<span class="content-category">상품 설명</span>
					<span class="content-category">후기<c:if test="${rtotal > 0 }">(${rtotal })</c:if></span>
					<span class="content-category">질문<c:if test="${rtotal > 0 }">(${qtotal })</c:if></span>
					
					<hr>
					
				</div>
				
				
					<div class="content-detail">
						${dto.getPro_cont() }
					</div>
				
				</c:if>
				
				<%-- 리뷰 --%>
				<div class="cont-board">
					<span class="table-title">후기</span>
					
					<c:if test="${!empty review }">
					<span class="review-star"><fmt:formatNumber value="${star / rtotal }" pattern="#.#" /> / 5</span>
					<span class="review-number"><c:if test="${rtotal > 0 }">(${rtotal }개 후기)</c:if></span>
					</c:if>
					
					<div class="photo-only">
						<input type="checkbox">
						사진 후기만 보기
					</div>
					
					<hr>
					
					<c:if test="${!empty review }">
					<ul>
					
					<c:forEach items="${review }" var="dto">
						<li>
							<div class="review">	
								<div class="review-wrap">	
									<span class="personal-star">
										<c:forEach begin="1" end="${dto.getReview_star() }" >★</c:forEach>
										<c:forEach begin="1" end="${5-dto.getReview_star() }" >☆</c:forEach>
										</span> 
									<span class="mem-id">${dto.getReview_writer() }</span> <br>
									<span class="review-cont">${dto.getReview_cont() }</span>
								</div>
								
								<c:if test="${!empty dto.getReview_img() }">
									<img src="resources/img/review/${dto.getReview_img() }">
								</c:if>
							</div>
						</li>
					</c:forEach>
					</ul>
					</c:if>
					<c:if test="${empty review }">
						작성된 후기가 없습니다.
					</c:if>
					
					<hr>
					
					<button class="write" onclick="#">후기 쓰기</button>
					<br>
					
					<%-- pagination --%>
					<div class="pagination">
						<c:if test="${rpage.getPage() > rpage.getBlock() }">
							<a href="product_cont.do?no=${cont.getPro_no() }&rpage=1">◀◀</a>
			   				<a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getStartBlock() - 1 }">◀</a>
						</c:if>
						
						<c:forEach begin="${rpage.getStartBlock() }" end="${rpage.getEndBlock() }" var="i">
					      <c:if test="${i == rpage.getPage() }">
					         <b><a href="product_cont.do?no=${cont.getPro_no() }&rpage=${i }">${i }</a></b>
					      </c:if>
					      
					      <c:if test="${i != rpage.getPage() }">
					         <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${i }">${i }</a>
					      </c:if>
					   </c:forEach>
					   
					   <c:if test="${rpage.getEndBlock() < rpage.getAllPage() }">
					      <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getEndBlock() +1 }">▶</a>
					      <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getAllPage() }">▶▶</a>
					   </c:if>
						
					</div>
				</div>
				
				
				<%-- 질문 --%>
				<div class="cont-board">
					<span class="table-title">질문</span>
					
					<hr>
					
					<c:if test="${!empty qna }">
					<ul>
						<li>
							<div class="qna-bar">
								<span class="qna-no">번호</span>
								<span class="qna-title">제목</span>
								<span class="qna-writer">글쓴이</span>
								<span class="qna-regdate">작성일자</span>
							</div>
						</li>
					
					
					<c:forEach items="${qna }" var="dto">
						<li>
							<div class="qna">	
								<span class="qna-no">${dto.getQna_no() }</span>
								<span class="qna-title"><a href="#">${dto.getQna_title() }</a></span>
								<span class="qna-writer">${dto.getQna_writer() }</span>
								<span class="qna-regdate">${dto.getQna_date().substring(0,10) }</span>
								
							</div>
						</li>
					</c:forEach>
					</ul>
					</c:if>
					
					<c:if test="${empty qna }">
							작성된 질문이 없습니다.
						</c:if>
					
					<hr>
					
					<button class="write" onclick="#">질문 쓰기</button>
					<br>
					
					<%-- pagination --%>
					<%-- pagination --%>
					<div class="pagination">
						<c:if test="${qpage.getPage() > qpage.getBlock() }">
							<a href="product_cont.do?no=${cont.getPro_no() }&qpage=1">◀◀</a>
			   				<a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getStartBlock() - 1 }">◀</a>
						</c:if>
						
						<c:forEach begin="${qpage.getStartBlock() }" end="${qpage.getEndBlock() }" var="i">
					      <c:if test="${i == qpage.getPage() }">
					         <b><a href="product_cont.do?no=${cont.getPro_no() }&qpage=${i }">${i }</a></b>
					      </c:if>
					      
					      <c:if test="${i != qpage.getPage() }">
					         <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${i }">${i }</a>
					      </c:if>
					   </c:forEach>
					   
					   <c:if test="${qpage.getEndBlock() < qpage.getAllPage() }">
					      <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getEndBlock() +1 }">▶</a>
					      <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getAllPage() }">▶▶</a>
					   </c:if>
						
					</div>
				</div>
				
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>