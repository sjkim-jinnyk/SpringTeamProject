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
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_review">
						<h3>구매후기</h3>
						<form method="post" action="<%=request.getContextPath()%>/review_search.do" name="reviewForm">
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
								<input id="search_btn" type="submit" value="검색">
							</li>
						</ul>  
						</form>
						<table class="review_bar">
						<c:set var="plist" value="${ProductInfo }"/>
						<c:set var="odlist" value="${OrderDetail }"/> 
						<c:set var="olist" value="${OrderInfo }"/> 
						<c:set var="rlist" value="${ReviewList }"/>
						
							<tr>
								<th id="info">상품정보</th><th id="date">구매일</th><th id="review">후기</th>
							</tr>
							<c:if test="${!empty rlist }">
								<c:forEach items="${olist }" var="olist" varStatus="status">
									<tr>
										<c:if test="${odlist[status.index].getOrder_pro_no() == plist[status.index].getPro_no()}">
										<td>
											<ul>
												<li class="img"><img src="resources/img/upload/${plist[status.index].getPro_img() }"></li>
												<li class="proname">${plist[status.index].getPro_name() }</li>
											</ul>
										</td>
										</c:if>
										
										<c:if test="${odlist[status.index].getOrder_pro_no() != plist[status.index].getPro_no()}">
											<td>XXX</td>
										</c:if>
										<c:if test="${olist.getOrder_no() == rlist[status.index].getOrder_no()}">
											<td>${olist.getOrder_date() }</td>
										</c:if>
										<c:if test="${olist.getOrder_no() != rlist[status.index].getOrder_no()}">
											<td>X</td>
										</c:if>
										<c:if test="${rlist[status.index].getReview_title() != null}">
											<td><a href="<%=request.getContextPath()%>/member_review_cont.do?no=${rlist[status.index].getOrder_no() }">${rlist[status.index].getReview_title() }</a></td>
										</c:if>
										<c:if test="${rlist[status.index].getReview_title() == null}">
											<td><input id="review_btn" type="button" value="후기쓰기" onclick="showPopup(${rlist[status.index].getOrder_no()})">
											
											<%-- <input id="review_btn" type="button" value="후기쓰기" onclick="location.href='member_review_write.do?no=${rlist[status.index].getOrder_no()}'"> --%>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty rlist && empty ReviewList_s}">
								<tr>
									<td colspan="5" id="noHistory">
										주문 내역이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty ReviewList_s}">
								<c:forEach items="${ReviewList_s }" var="dto" varStatus="status">
								<tr>
									<c:if test="${OrderDetail_s[status.index].getOrder_pro_no() == ProductInfo_s[status.index].getPro_no()}">
										<td>
											<ul>
												<li class="img"><img src="resources/img/upload/${ProductInfo_s[status.index].getPro_img() }"></li>
												<li class="proname">${ProductInfo_s[status.index].getPro_name() }</li>
											</ul>
										</td>
									</c:if>
									
									<c:if test="${OrderDetail_s[status.index].getOrder_pro_no() != ProductInfo_s[status.index].getPro_no()}">
										<td>XXX</td>
									</c:if>
									<c:if test="${Order_s[status.index].getOrder_no() == dto.getOrder_no()}">
										<td>${Order_s[status.index].getOrder_date() }</td>
									</c:if>
									<c:if test="${Order_s[status.index].getOrder_no() != dto.getOrder_no()}">
										<td>X</td>
									</c:if>
									<c:if test="${dto.getReview_title() != null}">
										<td><a href="<%=request.getContextPath()%>/member_review_cont.do?no=${dto.getOrder_no() }">${dto.getReview_title() }</a></td>
									</c:if>
									<c:if test="${dto.getReview_title() == null}">
									<td><input id="review_btn" type="button" value="후기쓰기" onclick="location.href='member_review_write.do?no=${dto.getOrder_no()}'"></td>
									</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_review.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
</html>