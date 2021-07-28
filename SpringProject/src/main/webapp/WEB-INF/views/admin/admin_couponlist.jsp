<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon create</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
		<div class="main">
		
		<div class="amdin-title">쿠폰 관리</div>

			<div align="center">

				<table class="table table-hover">
					<tr>
						<th>쿠폰 번호</th>
						<th>쿠폰 코드</th>
						<th>쿠폰 할인률</th>
						<th>쿠폰 상세내용</th>
					</tr>

					<c:set var="list" value="${CouponList }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.getCoupon_no() }</td>
								<td>${dto.getCoupon_code() }</td>
								<td>${dto.getCoupon_type() }<a>%</a></td>
								<td>${dto.getCoupon_cont() }</td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty list }">
						<tr>
							<td colspan="4" align="center">
								<h3>발행된 쿠폰이 없습니다</h3>
							</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4" align="right"><input type="button" class="default-btn"
							value="쿠폰발행" onclick="location.href='create_coupon.do'"></td>
					</tr>
				</table>
				<br>

				<%-- Pagination --%>
				<div class="pagination">
					<c:if test="${page.getPage() > page.getBlock() }">
						<a href="admin_coupon_list.do?page=1">◀◀</a>
						<a href="admin_coupon_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
					</c:if>

					<c:forEach begin="${page.getStartBlock() }"
						end="${page.getEndBlock() }" var="i">
						<c:if test="${i == page.getPage() }">
							<b><a href="admin_coupon_list.do?page=${i }">${i }</a></b>
						</c:if>

						<c:if test="${i != page.getPage() }">
							<a href="admin_coupon_list.do?page=${i }">${i }</a>
						</c:if>
					</c:forEach>

					<c:if test="${page.getEndBlock() < page.getAllPage() }">
						<a href="admin_coupon_list.do?page=${page.getEndBlock() +1 }">▶</a>
						<a href="admin_coupon_list.do?page=${page.getAllPage() }">▶▶</a>
					</c:if>
				</div>

			</div>
		</div>
		</div>
		</div>
</body>
</html>