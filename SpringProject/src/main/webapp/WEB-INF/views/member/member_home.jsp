<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
				<!-- header_title -->
				<div class="header_title">
					<a href="<%=request.getContextPath() %>/member_home.do"><h3>My Page</h3></a>
				</div> <!-- header_title END -->
				
				<!-- member_header -->
				<div class="member_header">
					<ul>
						<li><a href="<%=request.getContextPath()%>/member_info.do?id=${mem.getMem_id() }"><i class="fas fa-user-circle"></i></a></li>
						<li>
							<ul class="user_info">
								<li><a href="<%=request.getContextPath()%>/member_info.do?id=${mem.getMem_id() }">${mem.getMem_name() }님 </a>환영합니다.</li>
								<li><a id="mem_id" href="<%=request.getContextPath()%>/member_info.do?id=${mem.getMem_id() }">${mem.getMem_id() }</a></li>
							</ul>
						</li>
					</ul>
					<ul class="my_menu">
						<a href="">
							<li>
								<ul class="menu_bar">
									<li>적립금 </li>
									<li>${mem.getMem_point() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_coupon.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>쿠폰 </li>
									<li>${Coupon.getCount() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_review.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>리뷰 </li>
									<li>${Review.getReviewCount() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_productLike.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>찜 </li>
									<li>${Like.getLikeCount() }</li>
								</ul>
							</li>
						</a>
					</ul>
				</div> <!-- member_header END -->
				
				<!-- member_content -->
				<div class="member_content">
					<div class="nav_menu">
						<ul>
							<a href="<%=request.getContextPath() %>/member_home.do"><li>주문내역</li></a>
							<a href="<%=request.getContextPath() %>/member_qna.do?id=${mem.getMem_id() }"><li>문의내역</li></a>
							<a href="<%=request.getContextPath() %>/member_recent.do"><li>최근 본 상품</li></a>
							<li>
								<a href="#none" id="info_click">정보관리</a>
								<ul id="info_display" class="on">
									<a href="<%=request.getContextPath() %>/member_info.do?id=${mem.getMem_id() }"><li>회원정보 수정</li></a>
									<a href="<%=request.getContextPath() %>/member_info_delete.do?id=${mem.getMem_id() }"><li>회원 탈퇴</li></a>
								</ul>
							</li>
						</ul>
					</div> <!-- nav_menu END -->
					
					<div class="member_order">
						<h3 align="left">주문내역 조회</h3>
						<form method="post" action="<%=request.getContextPath()%>/order_search.do" name="orderForm">
						<ul class="select_day">
							<div class="select_button">
								<li><a id="sevenDay" class="off" href="#none">일주일</a></li>
								<li><a id="month" class="off" href="#none">1개월</a></li>
								<li><a id="threeMonth" class="off" href="#none">3개월</a></li>
								<li><a id="allDay" class="on" href="#none">전체 시기</a></li>
							</div>
							<li>
								<input type="date" id="orderFirst" name="orderFirst" value="${map.get('first') }"> - 
				    			<input type="date" id="orderLast" name="orderLast" value="${map.get('last') }">
							</li>
							<li>
								<input type="submit" value="검색">
							</li>
						</ul>  
						
						</form>
						<table class="order_bar" border="1">
						<tr>
							<th>주문번호</th><th>상품정보</th><th>주문일자</th><th>주문금액</th><th>주문상태</th>
						</tr>
						<c:if test="${!empty Order}">
						<c:forEach items="${Order }" var="dto" varStatus="status">
							<tr>
								<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
								<td>
									<ul>
										<li class="qnaimg"><img src="resources/img/product/${Detail[status.index].getPro_img() }"></li>
										<li>${Detail[status.index].getPro_name() }</li>
									</ul>
								</td>
								<td>${dto.getOrder_date().substring(0,10) }</td>
								<td>${dto.getOrder_price() }</td>
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
							<c:if test="${!empty OrderSearchList }">
								<c:forEach items="${OrderSearchList }" var="dto" varStatus="status">
								<tr>
									<td><a href="<%=request.getContextPath()%>/order_detail.do?no=${dto.getOrder_no() }">${dto.getOrder_no() }</a></td>
									<td>
										<ul>
											<li class="qnaimg"><img src="resources/img/product/${Detail[status.index].getPro_img() }"></li>
											<li>${Detail[status.index].getPro_name() }</li>
										</ul>
									</td>
									<td>${dto.getOrder_date().substring(0,10) }</td>
									<td>${dto.getOrder_price() }</td>
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
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_order.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
</html>