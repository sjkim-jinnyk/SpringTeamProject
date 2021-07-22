<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberStyle.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Member</title>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_orderDetail">
						<div class="order_detail">
							<c:set var="dto" value="${Order }" />
							<h3>주문 상세 내역</h3>
							<ul>
								<li id="tag">
									<span id="title">주문번호</span>
									<span>${dto.getOrder_no() }</span>
								</li>
								<li id="tag">
									<span id="title">주문일자</span>
									<span>${dto.getOrder_date() }</span>
								</li>
							</ul>
							
							<table class="order_bar">
								<tr>
									<th id="orderinfo">상품정보</th><th id="ordercoupon">쿠폰할인</th>
									<th id="orderprice">주문금액</th><th id="orderday">배송요일(주기)</th>
								</tr>
								<tr>
									<td>
										<a href="<%=request.getContextPath() %>/product_cont.do?no=${Product.getPro_no()}">
											<ul>
												<li><img class="img" src="resources/img/upload/${Product.getPro_img() }"></li>
												<li class="proname">${Product.getPro_name() }<br>
																	옵션: ${Order.getOrder_content() }</li>
											</ul>
										</a>
									</td>
									<td>${CouponCont.getCoupon_cont() }</td>
									<td><fmt:formatNumber value="${Order.getOrder_price() }" /> 원</td>
									<c:if test="${Order.getOption_day() == 0 && Order.getOption_term() == 0}">
										<td>월(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 0 && Order.getOption_term() == 1}">
										<td>월(2주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 1 && Order.getOption_term() == 0}">
										<td>화(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 1 && Order.getOption_term() == 1}">
										<td>화(2주)</td>
									</c:if>								
									<c:if test="${Order.getOption_day() == 2 && Order.getOption_term() == 0}">
										<td>수(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 2 && Order.getOption_term() == 1}">
										<td>수(2주)</td>
									</c:if>								
									<c:if test="${Order.getOption_day() == 3 && Order.getOption_term() == 0}">
										<td>목(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 3 && Order.getOption_term() == 1}">
										<td>목(2주)</td>
									</c:if>								
									<c:if test="${Order.getOption_day() == 4 && Order.getOption_term() == 0}">
										<td>금(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 4 && Order.getOption_term() == 1}">
										<td>금(2주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 5 && Order.getOption_term() == 0}">
										<td>토(1주)</td>
									</c:if>
									<c:if test="${Order.getOption_day() == 5 && Order.getOption_term() == 0}">
										<td>토(2주)</td>
									</c:if>								
								</tr>
							</table>
						</div> <!-- order_detail END -->
						<br><br>
						<div class="order_deliver">
							<h3>배송지 정보</h3>
							<table class="order_bar">
								<tr>
									<th>이름</th>
									<td>${myPage.getMemName() }</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${dto.getOrder_mem_phone() }</td>
								</tr>	
								<tr>
									<th>배송지 주소</th>
									<td>${dto.getOrder_addr() }</td>
								</tr>													
							</table>
						</div> <!-- order_deliver END -->
					</div> <!-- member_orderDetail END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_order.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script> --%>
</html>