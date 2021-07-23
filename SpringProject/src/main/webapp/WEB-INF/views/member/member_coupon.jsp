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
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_coupon">
						<h3>쿠폰 내역</h3>
						<table class="coupon_bar">
						<c:set var="clist" value="${CouponInfo }"/>
							<tr>
									<th id="num">쿠폰번호</th><th id="name">쿠폰명</th><th id="money">할인금액</th><th id="range">적용범위</th>
							</tr>
							<c:if test="${!empty clist }">
								<c:forEach items="${clist }" var="list">
									<tr>
										<td>${list.getCoupon_no() }</td>
										<td>${list.getCoupon_code() }</td>
										<td>${list.getCoupon_type() }</td>
										<td>${list.getCoupon_cont() }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty clist }">
								<tr>
									<td colspan="4" id="noCoupon">등록된 쿠폰이 없습니다.</td>
								</tr>
							</c:if>
						</table>
					</div> <!-- member_coupon END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</html>