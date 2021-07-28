<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/CommonStyle.css">
<link rel="stylesheet" href="resources/css/coupon.css?after">
<script type="text/javascript">
	function use_coupon(cont, type, no) {
		opener.document.getElementById("coupon_cont").value = cont;
		opener.document.getElementById("price").value = opener.document.getElementById("price_before").value * (100 - type) / 100;
		opener.document.getElementById("coupon_no").value = no;
		opener.document.getElementById("coupon_type").value = type;
		window.close();
	}
</script>
</head>
<body onLoad="window.resizeTo(740, 850); window.moveTo(500,100);">
	<div class="layout_container">
		<div class="main">
			<h1>쿠폰적용</h1>
		
			<div class="member_coupon">
				<table class="coupon_bar">
					<c:set var="clist" value="${CouponInfo }" />
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰코드</th>
						<th>할인내용</th>
						<th> </th>
					</tr>
					<c:if test="${!empty clist }">
						<c:forEach items="${clist }" var="list">
							<tr>
								<td>${list.getCoupon_no() }</td>
								<td>${list.getCoupon_code() }</td>
								<td>${list.getCoupon_cont() }</td>
								<td>
									<input type="button" value="선택" 
										onclick="use_coupon('${list.getCoupon_cont() }', '${list.getCoupon_type() }', '${list.getCoupon_no() }')" 
										class="select">	
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty clist }">
						<tr>
							<td colspan="4" class="no_coupon">등록된 쿠폰이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>