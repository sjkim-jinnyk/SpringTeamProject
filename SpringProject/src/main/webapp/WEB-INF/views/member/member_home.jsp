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
<title>마이페이지</title>
</head>
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
						<h3 id="headName">주문내역</h3>
						<form method="post" action="<%=request.getContextPath()%>/order_search.do" name="orderForm">
						<ul class="select_day">
							<div class="select_button">
								<li><a id="sevenDay" class="off" href="#none">일주일</a></li>
								<li><a id="month" class="off" href="#none">1개월</a></li>
								<li><a id="threeMonth" class="off" href="#none">3개월</a></li>
								<li><a id="allDay" class="on" href="#none">전체 시기</a></li>
							</div>
							<div class="select_date">
								<li>
									<input type="date" id="orderFirst" name="orderFirst" value="${map.get('first') }"> - 
					    			<input type="date" id="orderLast" name="orderLast" value="${map.get('last') }">
								</li>
								<li id="searchBtn">
									<input id="search_btn" type="submit" value="검색">
								</li>
							</div>
						</ul>  
						
						</form>
						<table class="order_bar">
							<tr>
								<th id="orderno">주문번호</th><th id="orderinfo">상품정보</th><th id="orderdate">주문일자</th>
								<th id="orderprice">주문금액</th><th id="orderstatus">주문상태</th>
							</tr>
							<c:if test="${!empty Order}">
								<c:forEach items="${Order }" var="dto" varStatus="status">
								<tr id="tablecont">
									<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
									<td>
										<ul>
											<li><img src="resources/img/upload/${Detail[status.index].getPro_img() }"></li>
											<li class="proname">${dto.getOrder_content() }</li>
										</ul>
									</td>
									<td>${dto.getOrder_date().substring(0,10) }</td>
									<td><fmt:formatNumber value="${dto.getOrder_price() }" /> 원</td>
									<c:if test="${!empty Deliver }">
										<c:forEach items="${Deliver }" var="del">
											<c:if test="${dto.getOrder_no() == del.getOrder_no()}">
													<c:if test="${del.getDeliver_status() == 0 }">
													<td>
														배송 준비 중
													</td>
												</c:if>
												<c:if test="${del.getDeliver_status() == 1 }">
													<td>
														배송중
													</td>
												</c:if>	
												<c:if test="${del.getDeliver_status()  == 2 }">
													<td>
														배송완료
													</td>
												</c:if> 
											</c:if>
										</c:forEach>
									</c:if>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty Order && empty OrderSearchList}">
								<tr>
									<td colspan="5" id="noHistory">
										주문 내역이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty OrderSearchList }">
								<c:forEach items="${OrderSearchList }" var="dto" varStatus="status">
								<tr id="tablecont">
									<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
									<td>
										<ul>
											<li class="img"><img src="resources/img/upload/${Detail[status.index].getPro_img() }"></li>
											<li class="proname">${dto.getOrder_content() }</li>
										</ul>
									</td>
									<td>${dto.getOrder_date().substring(0,10) }</td>
									<td><fmt:formatNumber value="${dto.getOrder_price() }" /> 원</td>
										<c:forEach items="${DeliverS }" var="del">
											<c:if test="${dto.getOrder_no() == del.getOrder_no()}">
													<c:if test="${del.getDeliver_status() == 0 }">
													<td>
														배송 준비 중
													</td>
												</c:if>
												<c:if test="${del.getDeliver_status() == 1 }">
													<td>
														배송중
													</td>
												</c:if>	
												<c:if test="${del.getDeliver_status()  == 2 }">
													<td>
														배송완료
													</td>
												</c:if> 
											</c:if>
										</c:forEach>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						<!-- 576px -->
						<table class="order_bar_x576">
							<tr>
								<th id="orderno">주문번호</th><th id="orderinfo">상품정보</th><th id="orderdate">주문일자</th>
								<th id="orderstatus">주문상태</th>
							</tr>
							<c:if test="${!empty Order}">
								<c:forEach items="${Order }" var="dto" varStatus="status">
								<tr id="tablecont">
									<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
									<td>
										<ul>
											<li><img src="resources/img/upload/${Detail[status.index].getPro_img() }"></li>
											<li class="proname">${dto.getOrder_content() }</li>
										</ul>
									</td>
									<td>${dto.getOrder_date().substring(0,10) }</td>
									<c:if test="${!empty Deliver }">
										<c:forEach items="${Deliver }" var="del">
											<c:if test="${dto.getOrder_no() == del.getOrder_no()}">
													<c:if test="${del.getDeliver_status() == 0 }">
													<td>
														배송 준비 중
													</td>
												</c:if>
												<c:if test="${del.getDeliver_status() == 1 }">
													<td>
														배송중
													</td>
												</c:if>	
												<c:if test="${del.getDeliver_status()  == 2 }">
													<td>
														배송완료
													</td>
												</c:if> 
											</c:if>
										</c:forEach>
									</c:if>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty Order && empty OrderSearchList}">
								<tr>
									<td colspan="4" id="noHistory">
										주문 내역이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty OrderSearchList }">
								<c:forEach items="${OrderSearchList }" var="dto" varStatus="status">
								<tr id="tablecont">
									<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
									<td>
										<ul>
											<li class="img"><img src="resources/img/upload/${Detail[status.index].getPro_img() }"></li>
											<li class="proname">${Detail[status.index].getPro_name() }</li>
										</ul>
									</td>
									<td>${dto.getOrder_date().substring(0,10) }</td>
										<c:forEach items="${DeliverS }" var="del">
											<c:if test="${dto.getOrder_no() == del.getOrder_no()}">
													<c:if test="${del.getDeliver_status() == 0 }">
													<td>
														배송 준비 중
													</td>
												</c:if>
												<c:if test="${del.getDeliver_status() == 1 }">
													<td>
														배송중
													</td>
												</c:if>	
												<c:if test="${del.getDeliver_status()  == 2 }">
													<td>
														배송완료
													</td>
												</c:if> 
											</c:if>
										</c:forEach>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_order.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
</html>