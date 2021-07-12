<%@page import="com.spring.model.ProductDTO"%>
<%@page import="com.spring.model.CartDTO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/product.css">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

<% List<ProductDTO> pList = (List<ProductDTO>)request.getAttribute("pList"); %>

function resetCart() {
	if(confirm("장바구니를 비우시겠습니까?")){
        location.href="cart_reset.do";
    }
};

function checkAll() {  /* 체크박스 전체선택 함수 */
	$("input[name=check]").prop("checked", $("#checkAll").prop("checked"));
};

function count(type, ths) {
	
	let id = $(ths).attr('name');
	let text = document.getElementById('cart-amount-'+id).value;
	
	if(type == 'plus'){
		document.getElementById('cart-amount-'+id).value = parseInt(text) + 1;
	}else if(type == 'minus' && text > 1) {
		document.getElementById('cart-amount-'+id).value = parseInt(text) - 1;
	}
	
	total(ths);
} 

/* function count(type, ths) {
	
	let id = $(ths).attr('name');
	let no = $('#cart-no-'+id).val();
	
	console.log("id " + id);
	console.log("no " + no);
	
	if(type == 'plus'){
		$.ajax({
			type: "post",
			url: "cart_amount_plus.do",
			data: {"no": no},
			success: function(data) {
				if(data == 1) {
					alert('에이젝스 성공!');
					location.reload();
				}else {
					alert('에이젝스 실패!')
				}
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});		
	}else if(type == 'minus' && text > 1) {
		$.ajax({
			type: "post",
			url: "cart_amount_minus.do",
			data: {"no": no},
			success: function(data) {
				if(data == 1) {
					alert('에이젝스 성공!');
				}else {
					alert('에이젝스 실패!')
				}
			},
			error: function(){
				alert("통신 오류입니다.");
			}
		});
	}
	
	total(ths);
	
	
	
} */

function total(ths) {
	
	let id = $(ths).attr('name');
	let price = document.getElementById('cart-price-'+id).value;
	let amount = document.getElementById('cart-amount-'+id).value;
	let total = String(parseInt(price) * parseInt(amount)).replace(/(.)(?=(\d{3})+$)/g,'$1,');
	
	document.getElementById('total-price-'+id).innerText = total;
	
	let total_price = 0;
	for(i=0; i<<%=pList.size()%>; i++) {
		
		let prc = document.getElementById('cart-price-'+(i+1)).value;
		let amt = document.getElementById('cart-amount-'+(i+1)).value;
		total_price += parseInt(prc) * parseInt(amt);
	}
	
	document.getElementById('total-price').innerText = String(total_price).replace(/(.)(?=(\d{3})+$)/g,'$1,');
}

</script>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			<div class="main">			
			
				<div class="history-title">
				장바구니<c:if test="${!empty cList }">(${cList.size() })</c:if>
				</div>
				
				
				<div class="history-wrap">
					<ul>
						<li>
							<div class="history">
								<input id="checkAll" type="checkbox" onclick="checkAll()">
								
								<div class="pro-content">
									상품 정보
								</div>
								
								<div class="pro-btn">
									수량
								</div>
								
								<div class="pro-price">
									가격
								</div>
							</div>
						</li>
					</ul>
				
				<form method="post">
					<ul>
					
					<c:if test="${!empty cList }">
					<c:forEach items="${cList }" var="dto" varStatus="status">
						<li>
							<div class="history" id="history-${status.count }">
								<input id="cart-no-${status.count }" type="hidden" value="${dto.getCart_no() }">
								<input name="check" type="checkbox" value="${dto.getCart_no() }">
								<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}"><img src="resources/img/product/${pList[status.index].getPro_img() }"></a>
								
								<div class="pro-content">
									<span>${pList[status.index].getPro_tag() }</span><br>
									<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}">${pList[status.index].getPro_name() }</a>
								</div>
								
								<div class="pro-btn">
									
									<button type="button" name="${status.count }" onclick="count('minus', this)">-</button>
									<input class="cart-amount" id="cart-amount-${status.count }" name="cart_amount" value="${dto.getCart_amount() }">
									<button type="button" name="${status.count }" onclick="count('plus', this)">+</button>
									개
								</div>
								
								<div class="pro-price">
									<input type="hidden" id="cart-price-${status.count }" value="${pList[status.index].getPro_output_price() }">
									<span id="total-price-${status.count }"><fmt:formatNumber value="${pList[status.index].getPro_output_price() * dto.getCart_amount() }" /></span> 원
								</div>
								
								<div class="pro-cancel">
									<button onclick="location.href='cart_delete.do?no=${pList[status.index].getPro_no() }'">X</button>
								</div>
							</div>
						</li>
						</c:forEach>
						
						
						<li>
							<div class="price-amount-wrap">
								<span class="pro-amount">상품 합계</span>
								<span id="total-price" class="price-amount">
									<fmt:formatNumber value="${total }" />
								</span> 원
							</div>
						</li>
						</c:if>	
						
						<c:if test="${empty cList }">
						<li>
							장바구니가 비었습니다.
						</li>
						</c:if>
					</ul>
					<c:if test="${!empty cList }">
						<button type="submit" class="order-btn" formaction="cart_delete_seleted.do">선택상품 삭제</button>
						<button type="button" class="order-btn" onclick="resetCart();">전체상품 삭제</button>
					</c:if>
					<button class="order-btn" onclick="#">선택상품주문하기</button>
					<button class="order-btn" onclick="#">전체상품주문하기</button>
					</form>
				</div>
				
				
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>