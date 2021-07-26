<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/review.css">
<title>리뷰</title>
</head>
<body>

	<jsp:include page="../include/header.jsp" />
	
	<div class="review_header">
		<div class="review_title"><p>실구매자 분들의</p><p>솔직한 상품후기</p></div>
	</div>
	
	<div class="layout_container">
		
		<div class="main">
			
			<div class="review_wrap">
			
				<div class="review_guide">
					<div class="left">
						<p class="title">후기 작성시 포인트 지급</p>
						<p>사진 후기 작성 시</p>
						<p><span>150Point 적립</span></p>
						<p>텍스트 후기 작성 시</p>
						<p><span>50Point 적립</span></p>
						<p class="notice">(유의사항) 지급된 포인트는 발급일로부터 1년간1만원 이상 구매시 사용 가능, 네이버페이 결제시 포인트는 네이버페이 정책에 따름</p>
					</div>
					<div class="right">
						<p class="title">인스타그램 후기 작성시 추가 적립금</p>
						<p>인스타그램, 블로그에 후기 남기고 URL 남기면</p>
						<p>매월 10분씩 선정해서 1,000포인트 추가 적립</p>
						<p>1. 인스타그램 <span>@freshugly 계정 팔로우</span></p>
						<p>2. <span>#프레시어글리 #못생겨도맛은좋아</span> 태그하고 후기 작성</p>
						<p>3. 리뷰 게시판에 후기와 함께 SNS 게시물 주소 남기기</p>
					</div>
				</div>
			
				<div class="block_group">
					<c:if test="${!empty List }">
						<c:forEach items="${List }" var="dto">
						
							<div class="block">
								<div class="below">
								
									<c:if test="${!empty dto.getReview_img()}">
										<a href="<%=request.getContextPath() %>/review_cont.do?no=${dto.getReview_no()}"><img class="pro_img" src="resources/img/upload/${dto.getReview_img() }"></a>
									</c:if>
									
									<c:if test="${empty dto.getReview_img()}">
										<a href="<%=request.getContextPath() %>/review_cont.do?no=${dto.getReview_no()}"><img class="pro_img" src="resources/img/upload/review_sample.jpeg"></a>
									</c:if>
									
									<span class="product">상품: ${dto.getReview_pro() }</span>
									<span class="star"><c:forEach begin="1" end="${dto.getReview_star() }" >★</c:forEach></span>
									
								</div>
								<div class="under">
									<c:if test="${dto.getReview_cont().length() > 15 }">
										<span class="cont">내용: ${dto.getReview_cont().substring(0,15) } ...</span>
									</c:if>
									
									<c:if test="${dto.getReview_cont().length() < 15 }">
										<span class="cont">내용: ${dto.getReview_cont() }</span>
									</c:if>
									
									<span class="writer">고객명: ${dto.getReview_writer() }</span>
								</div>
							</div>
							
						</c:forEach>
					</c:if>
				</div>
				
				<c:if test="${empty List }">
					등록된 리뷰가 없습니다.
				</c:if>
				
			    <div class="pagination">
					<c:if test="${page.getPage() > page.getBlock() }">
						<a href="review_list.do?page=1">◀◀</a>
		   				<a href="review_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
					</c:if>
					
					<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
				      <c:if test="${i == page.getPage() }">
				         <b><a href="review_list.do?page=${i }">${i }</a></b>
				      </c:if>
				      
				      <c:if test="${i != page.getPage() }">
				         <a href="review_list.do?page=${i }">${i }</a>
				      </c:if>
				   </c:forEach>
				   
				   <c:if test="${page.getEndBlock() < page.getAllPage() }">
				      <a href="review_list.do?page=${page.getEndBlock() +1 }">▶</a>
				      <a href="review_list.do?page=${page.getAllPage() }">▶▶</a>
				   </c:if>
					
				</div>
			</div>
			
			
			
		</div>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>