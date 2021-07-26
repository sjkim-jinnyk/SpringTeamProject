<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>찜한 상품</title>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_like">
						<h3>찜 리스트</h3>
						<c:if test="${!empty ProductLikeInfo}">
						<ul id="allList">
						<c:forEach items="${ProductLikeInfo }" var="dto">
							<li id="box">
								<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}">
									<img src="resources/img/upload/${dto.getPro_img() }">
								</a>
								<ul id="stepList">
									<li class="product-info">
										<a class="pro-tag" href="#">${dto.getPro_tag() }</a>
									</li>
									<li>
										<a class="pro-name" href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}">${dto.getPro_name() }</a>
									</li>
									<li>
										<span class="pro-price"><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원</span>
									</li>
									<li>
										<a href="<%=request.getContextPath() %>/productLike_delete.do?no=${dto.getPro_no()}&id=${session_id}">
											<span id="heart"><i class="fas fa-heart"></i></span>
										</a>
									</li>
								</ul>
							</li>
						</c:forEach>
						</ul>
						</c:if>
						<c:if test="${empty ProductLikeInfo}">
							<p id="noLike">찜한 상품이 없습니다.</p>
						</c:if>
					</div> <!-- member_like END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>