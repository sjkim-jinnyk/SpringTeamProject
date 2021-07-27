<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/purchase.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<!-- 개발 중 purchase.do로 접근 --> 
	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		
		<div class="main">
			<br> <br>
			<h1>결제 정보</h1>
			<br> <br>
			<input type="hidden" id="id" value="${session_id }">
			<form method="post" id="form"
	      		action="<%=request.getContextPath() %>/order.do">
				
				<table>
					<tr>
						<th>배송지</th>
						<td>
							<span>
								<input type="radio" name="rdAddrSetMod" checked="checked" 
									onclick="memberInfoDisplay()" value="0" class="radio_button"> 회원정보동일
							</span>
							<span>
								<input type="radio" name="rdAddrSetMod" onclick="newInfoDisplay()" value="1" 
									class="radio_button"> 새로입력
							</span>
						</td>
					</tr>
				</table>
				
				<!-- 회원정보동일 -->
				<table id="memberInfo" class="info_table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" readonly="readonly" value="${orderDTO.getOrder_mem_name() }"></td>
					</tr>
	
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" id="phone" readonly="readonly" value="${orderDTO.getOrder_mem_phone() }"></td>
					</tr>
	
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="zip" id="zip" readonly="readonly" value="${orderDTO.getOrder_zip() }"></td>
					</tr>
	
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr" id="addr" readonly="readonly" value="${orderDTO.getOrder_addr() }"></td>
					</tr>
				</table>
				
				<!-- 새로입력 -->
				<table id="newInfo" style="display: none" class="info_table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="new_name" id="new_name"></td>
					</tr>
	
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="new_phone" id="new_phone"></td>
					</tr>
	
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text" name="new_zip" id="new_zip" readonly="readonly" 
								onclick="sample6_execDaumPostcode()" placeholder="우편번호 찾기">
						</td>
					</tr>
	
					<tr>
						<th>주소</th>
						<td><input type="text" name="new_addr" id="new_addr" readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="new_addr_detail" id="new_addr_detail"></td>
					</tr>
				</table>
				
				<br>
				
				<table class="info_table">
					<tr>
						<th>주문 상세내역</th>
						<td>
							<input type="text" name="cont" id="cont" readonly="readonly"
								value="${orderDTO.getOrder_content() }">
						</td>
					</tr>
	
					<tr>
						<th>쿠폰</th>
						<td>
							<input type="text" id="coupon_cont" readonly="readonly" 
								onclick="coupon_select()" placeholder="쿠폰 선택">
							<input type="hidden" name="coupon_no" id="coupon_no">
						</td>
					</tr>
	
					<tr>
						<th>배송요일</th>
						<td>
							<span><input type="radio" name="rdDeliverDay" value="2" checked="checked" class="radio_button"> 화</span>
							<span><input type="radio" name="rdDeliverDay" value="4" class="radio_button"> 목</span>
						</td>
					</tr>
	
					<tr>
						<th>배송주기</th>
						<td>
							<span><input type="radio" name="rdDeliverTerm" value="1" checked="checked" class="radio_button"> 1주일</span>
							<span><input type="radio" name="rdDeliverTerm" value="2" class="radio_button"> 2주일</span>
							<!-- <br>
							<span class="info">※단건결제시 선택하지 않으셔도 됩니다.</span> -->
						</td>		
					</tr>
				</table>
				<br>
				
				<table class="total_table">
					<tr>
						<th>최종 결제금액</th>
						<td>
							<input type="text" name="price" id="price" readonly="readonly" value="${orderDTO.getOrder_price() }" class="total_price">원
							<input type="hidden" id="price_before" value="${orderDTO.getOrder_price() }">
						</td>
					</tr>
	
				</table>
				
			</form>
			
			<br>

			<div class="button_wrap">
				<button id="pay_button" class="pay_button"></button>
				<!-- <button id="pay_button2" class="pay_button">카카오 정기 결제(구현중)</button> -->
				
				<button id="pay_button_new" hidden="" class="pay_button"></button>
				<!-- <button id="pay_button2_new" hidden="" class="pay_button">카카오 정기 결제(구현중)_new</button> -->
				
			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/kakao.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/purchase.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>