<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		<div class="main" align="center">

			<h1>kakaoPay api 이용하기</h1>

			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id"></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input type="text" id="name"></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" id="phone"></td>
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input type="text" id="zip"></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text" id="addr"></td>
				</tr>

				<tr>
					<th><font color="red">주문 상세내역 - 필수</font></th>
					<td><input type="text" id="cont"></td>
				</tr>

				<tr>
					<th>쿠폰번호</th>
					<td><input type="text" id="coupon_no"></td>
				</tr>

				<tr>
					<th><font color="red">총 가격 - 필수</font></th>
					<td><input type="text" id="price"></td>
				</tr>

				<tr>
					<th>배송요일</th>
					<td><input type="text" id="day"></td>
				</tr>

				<tr>
					<th>배송주기</th>
					<td><input type="text" id="term"></td>
				</tr>

			</table>

			<button id="pay_button">카카오 단건 결제</button>
			<button id="pay_button2">카카오 정기 결제(구현중)</button>

		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/kakao.js"></script>
</html>