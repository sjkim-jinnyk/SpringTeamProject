<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>최근 본 상품</title>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_recent">
						<h3>최근 본 상품</h3>
						<c:if test="${!empty list }">
						<ul id="allList">
							<c:forEach items="${list }" var="dto">
							
							<input type="hidden" name="product_no" value="${dto.getProductDTO().getPro_no() }">
								<li id="box">
								<form method="post">
									<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getProductDTO().getPro_no()}">
										<img src="resources/img/upload/${dto.getProductDTO().getPro_img() }">
									</a>
									<ul id="stepList">
										<li class="pro-content">
											<c:forEach items="${dto.getProductDTO().getPro_tags() }" var="tags">
											<a class="cont-info-tag" href="search_tag.do?k=${tags }">${tags }</a> 
												</c:forEach><br>
															<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getProductDTO().getPro_no()}">${dto.getProductDTO().getPro_name() }</a>
										</li>
										<li>
											<fmt:formatNumber value="${dto.getProductDTO().getPro_output_price() }" /> 원
										</li>
										<li>
											<input type="submit" value="&#xf07a" formaction="add_cart.do">
										</li>
									</ul>
								</form>
								</li>
							
							</c:forEach>
						</ul>
						</c:if>
						<c:if test="${empty list }">
							
							<p id="noHistory">최근 본 상품이 없습니다.</p>
									
						</c:if>
					</div> <!-- member_recet END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>