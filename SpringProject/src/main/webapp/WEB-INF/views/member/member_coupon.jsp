<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>쿠폰 내역</title>
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
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>