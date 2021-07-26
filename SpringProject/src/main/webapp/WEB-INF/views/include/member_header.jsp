<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<body>
	<c:set var="dto" value="${myPage }" />
	<!-- header_title -->
	<div class="header_title">
		<a href="<%=request.getContextPath() %>/member_home.do"><h3>My Page</h3></a>
	</div> <!-- header_title END -->
	
	<!-- member_header -->
	<div class="member_header">
		<ul>
			<li><a href="<%=request.getContextPath()%>/member_info.do?id=${dto.getMemId() }"><i class="fas fa-user-circle"></i></a></li>
			<li>
				<ul class="user_info">
					<li id="mem_id"><a href="<%=request.getContextPath()%>/member_info.do?id=${dto.getMemId() }">${dto.getMemId() }</a></li>
					<li><a href="<%=request.getContextPath()%>/member_info.do?id=${dto.getMemId() }">${dto.getMemName() }</a>님 환영합니다.</li>
				</ul>
			</li>
		</ul>
		<ul class="my_menu">
			<li>
				<ul class="menu_bar">
					<li>적립금 </li>
					<li id="menu_cont"><fmt:formatNumber value="${dto.getPoint() }" /></li>
				</ul>
			</li>
			<a href="<%=request.getContextPath() %>/member_coupon.do?id=${dto.getMemId() }">
				<li>
					<ul class="menu_bar">
						<li>쿠폰 </li>
						<li id="menu_cont">${dto.getCouponCount() }</li>
					</ul>
				</li>
			</a>
			<a href="<%=request.getContextPath() %>/member_review.do?id=${dto.getMemId() }">
				<li>
					<ul class="menu_bar">
						<li>후기 </li>
						<li id="menu_cont">${dto.getReviewCount() }</li>
					</ul>
				</li>
			</a>
			<a href="<%=request.getContextPath() %>/member_productLike.do?id=${dto.getMemId() }">
				<li>
					<ul class="menu_bar">
						<li>찜 </li>
						<li id="menu_cont">${dto.getLikeCount() }</li>
					</ul>
				</li>
			</a>
		</ul>
	</div> <!-- member_header END -->
			
</body>
</html>