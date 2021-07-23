<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_order">
						<h3>최근 본 상품</h3>
						<table class="order_bar" border="1">
							<tr>
								<th>상품 정보</th><th>가격</th><th>구매</th><th></th>
							</tr>
							
								<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto">
								<tr>
									<td>
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
									</td>
									<td>	
											<div class="pro-price">
												<fmt:formatNumber value="${dto.getProductDTO().getPro_output_price() }" /> 원
											</div>
									</td>
									<td>		
											<div class="pro-btn">
												<input type="submit" value="구매하기" formaction="#">
												<input type="submit" value="장바구니에 담기" formaction="add_cart.do">
											</div>
									</td>
									<td>		
											<div class="pro-cancel">
												<button onclick="location.href='recent_delete.do?no=${dto.getProductDTO().getPro_no() }'">X</button>
											</div>
									</td>
									</div>
									
									</form>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty list }">
									<tr>
									<td colspan="4">
									
										<h3>최근 본 상품이 없습니다.</h3>
									</td>
									</tr>
								</c:if>
							
						</table>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</html>