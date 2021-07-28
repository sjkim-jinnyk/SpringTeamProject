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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="resources/css/main.css?after">
<title>울퉁불퉁's 장바구니</title>
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			
			<div class="about_header">
				<span>CART</span>
				<img src="resources/img/main/orange_bg.jpeg">
			</div>
			
			<div class="main">			
			
				<div class="history-title">
				장바구니<c:if test="${!empty cList }"> <span class="cart-size">(${cList.size() })</span></c:if>
				</div>
				
				<div class="history-wrap">
					<ul>
						<li>
							<div class="history">
								<div class="pro-check">
									<input id="checkAll" type="checkbox" onclick="checkAll()">
								</div>
								<div class="cart-wrap">
								<div class="pro-cont cart-title">
									상품 정보
								</div>
								
								<div class="cart-price cart-title">
									가격
								</div>
								
								<div class="pro-btn cart-title">
									수량
								</div>
								
								<div class="pro-total cart-title">
									합계
								</div>
								</div>
								<div class="pro-cancel cart-title"></div>
							</div>
						</li>
					</ul>
				
				<form method="post">
					<ul>
					
					<c:if test="${!empty cList }">
					<c:forEach items="${cList }" var="dto" varStatus="status">
					
						<li>
							<div class="history" id="history-${status.index }">
								<input id="cart-no-${status.index }" type="hidden" value="${dto.getCart_no() }">
								<div class="pro-check cart-in">								
									<input name="check" type="checkbox" value="${dto.getCart_no() }">
								</div>
								
								<div class="cart-wrap">
								<div class="pro-cont">
									<a href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}"><img src="resources/img/upload/${pList[status.index].getPro_img() }"></a>
									
									<div class="pro-content">
										<c:forEach items="${pList[status.index].getPro_tags() }" var="tags">
											<span><a class="cart-tag" href="search_tag.do?k=${tags }">${tags }</a></span> 
										</c:forEach><br>
										<a class="cart-name pro-name" href="<%=request.getContextPath()%>/product_cont.do?no=${pList[status.index].getPro_no()}">${pList[status.index].getPro_name() }</a>
									</div>
								</div>
								
								<div class="cart-price cart-in">
									<span class="hidden-title">가격</span><span class="price-font"><fmt:formatNumber value="${pList[status.index].getPro_output_price() }" />원</span>
								</div>
								
								<div class="pro-btn cart-in">
									<span class="hidden-title">수량</span>
										<button type="button" onclick="count('m', ${status.index }, ${dto.getCart_no() })"><i class="fas fa-minus"></i></button>
										<input class="cart_amount" id="cart-amount-${status.index }" name="cart_amount" value="${dto.getCart_amount() }">
										<button type="button" onclick="count('p', ${status.index }, ${dto.getCart_no() })"><i class="fas fa-plus"></i></button>
								</div>
								
								<div class="pro-total cart-in">
									<span class="hidden-title">합계</span>
									<input type="hidden" id="cart-price-${status.index }" value="${pList[status.index].getPro_output_price() }">
									<span id="total-price-${status.index }"><fmt:formatNumber value="${pList[status.index].getPro_output_price() * dto.getCart_amount() }" /></span>원
								</div>
								</div>
								<div class="pro-cancel cart-in">
									<button type="button" onclick="location.href='cart_delete.do?no=${pList[status.index].getPro_no() }'"><i class="fas fa-times"></i></button>
								</div>
							</div>
						</li>
						</c:forEach>
						
						
						<li>
							<div class="price-amount-wrap">
								<span class="pro-amount">상품 합계</span>&nbsp;&nbsp;
								<span id="total-price" class="price-amount">
									<fmt:formatNumber value="${total }" />원
								</span> 
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
						<div class="cart-del">
							<button type="submit" formaction="cart_delete_seleted.do">선택상품 삭제</button>
							<button type="button" onclick="resetCart();">전체상품 삭제</button>
						</div>
					</c:if>
					
					<div class="cart-btn">
						<button type="button" class="order-btn order-all" onclick="loginCheck();">전체상품주문하기</button>
						<button type="button" class="order-btn order-selected" onclick="loginCheck();">선택상품주문하기</button>
					</div>
					</form>
					
				</div>
				<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
				<div class="null"></div>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/product.js"></script>
<script type="text/javascript">

<% List<CartDTO> cList = (List<CartDTO>)request.getAttribute("cList"); %>

function count(type, index, no) {

	 let amount = parseInt($('#cart-amount-'+index).val());
	 let price = parseInt($('#cart-price-'+index).val());
	 
	 if((type == 'p' && amount > 0) || type == 'm' && amount > 1) {
		$.ajax({
			type: 'post',
			url: 'cart_amount_set.do',
			data: {'type' : type, 'no' : no },
			success: function(data) {
				if(data == 1) {
					amount += 1;
					$('#cart-amount-'+index).attr('value', amount);
					$('#total-price-'+index).text(String(amount*price).replace(/(.)(?=(\d{3})+$)/g,'$1,'));
					total();
					return false;
				}else if(data == 2) {
					amount -= 1;
					$('#cart-amount-'+index).attr('value', amount);
					$('#total-price-'+index).text(String(amount*price).replace(/(.)(?=(\d{3})+$)/g,'$1,'));
					total();
					return false;
				}else {
					console.log('data', data);
					alert('에이젝스 실패');
				}
			},
			error:function(request,status,error){
		    alert('code:'+request.status+'\n'+'message:'+request.responseamount+'\n'+'error:'+error);}
		});		
	 }
} 


function total() {
	
	let total_price = 0;
	 
	for(i=0; i<<%=cList.size()%>; i++) {
		let prc = $('#cart-price-'+i).val();
		let amt = $('#cart-amount-'+i).val();
		total_price += parseInt(prc) * parseInt(amt);
	}
	
	$('#total-price').text(String(total_price).replace(/(.)(?=(\d{3})+$)/g,'$1,'));
}

function loginCheck(){
	if('${session_id}' == ''){
		alert('로그인 후 사용가능합니다.');
		window.open("login_popup.do", "로그인", "_blank");
		return;
	} else if (${empty cList }) {
		alert('주문 할 상품이 없습니다.');
	} else {
		location.href='purchase.do';
	}
}
</script>
</html>