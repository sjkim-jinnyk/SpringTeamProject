<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
			<div class="review_header">
				<span>실구매자 분들의 솔직한 구매후기</span>
				<hr>
			</div>
			
			<c:if test="${!empty List }">
				<c:forEach items="${List }" var="dto">
					<div class="review">
						
						<div class="below">
							<div class="img">[해당 상품 사진]</div>
							<span>${dto.getReview_pro() }</span>
							<c:forEach begin="1" end="${dto.getReview_star() }" >★</c:forEach>
						</div>
						
						<div class="under">
							<span>${dto.getReview_title() }</span>
							<span>${dto.getReview_writer) }</span>
						</div>
						
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty List }">
				등록된 리뷰가 없습니다.
			</c:if>
			
			<%-- <div class="pagination">
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
				
			</div> --%>
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>