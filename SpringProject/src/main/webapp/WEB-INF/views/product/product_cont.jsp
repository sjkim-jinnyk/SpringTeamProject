<%@page import="com.spring.model.ProductDTO" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>울퉁불퉁's - ${cont.getPro_name() }</title>
</head>
<body>
	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
			<div class="main">			
				
				<div class="product_cont">

				<%-- 상단 제품 소개 및 주문 --%>
				<c:set var="dto" value="${cont }" />
				<c:if test="${!empty cont }">
					<div class="product-container">
						<div class="cont-photo-wrap">
							<img class="cont-photo" src="resources/img/upload/${dto.getPro_img() }">
						</div>
						
						<div class="cont-info">
						<form method="post">
							<input type="hidden" name="product_no" value="${dto.getPro_no() }"> 
							
							<div class="info-wrapper">
							<c:forEach items="${dto.getPro_tags() }" var="tags">
								<a class="cont-info-tag" href="search_tag.do?k=${tags }">${tags }</a> 
							</c:forEach><br>
							
								<span class="cont-info-title">${dto.getPro_name() }</span><br>
								<span class="cont-info-price">가격</span>
								<span id="price" class="cont-info-price"><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원</span>
								<table>
									<tr>
										<th>택배배송</th>
										<td>무료배송</td>
									</tr>
								</table>
								<table>
									<tr>
										<th class="shipping">배송요일</th>
										<td class="shipping">화▪목 중 택1</td>
									</tr>
									<tr>
										<th class="shipping">배송주기</th>
										<td class="shipping">1주마다▪2주마다 중 택1</td>
									</tr>
									<tr><td></td></tr>
									<tr>
										<td colspan="2" class="shipping text">배송요일과 배송주기는 주문창에서 선택하실 수 있습니다.</td>
									</tr>
								</table>
							</div>
							
							<div class="cont-amount">
								<button class="minus-btn" type="button" onclick="count('minus');" value="-"><i class="fas fa-minus"></i></button>
								<input type="text" id="cart_amount" class="cart_amount" name="cart_amount" value="1" onchange="total();">
								<button class="plus-btn" type="button" onclick="count('plus');" value="+"><i class="fas fa-plus"></i></button>
							</div>
							
							<div class="cont-total">
								<span class="total-title">총 상품 금액</span>
								<div class="total-wrapper">
									<span class="total-amount">총 수량 <span id="total-amount">1</span> 개 | </span>
									<span id="total-price" class="total-price"><fmt:formatNumber value="${dto.getPro_output_price() }"/> </span> 원
								</div>
							</div>
							
							<div class="btn-wrapper">
								<button type="submit" class="cont-btn btn-cart" formaction="add_cart.do">장바구니</button>
								<button type="button" class="cont-btn btn-purchase" onclick="loginCheck();">구매하기</button>
								<c:if test="${likeCheck eq 0 }"><button class="like-btn" type="button" id="like-btn" onclick="likeCheck(${dto.getPro_no() })"><i class="fas fa-heart"></i></button></c:if>
								<c:if test="${likeCheck > 0 }"><button type="button" id="like-btn" class="like-btn like-checked" onclick="likeCheck(${dto.getPro_no() })"><i class="fas fa-heart"></i></button></c:if>
							</div>
							</form>
						</div><%-- cont-info end --%>
					</div><%-- product-cont end --%>
				
				
				
				<%-- 상품 상세설명 --%>
				<div class="content-wrapper">
					<div id="content-bar" class="product-content">
						<span class="content-category"><a href="#content-detail">상품 설명</a></span>
						<span class="content-category"><a href="#review">후기</a><c:if test="${rtotal > 0 }">(${rtotal })</c:if></span>
						<span class="content-category"><a href="#qna">Q&A</a><c:if test="${rtotal > 0 }">(${qtotal })</c:if></span>
						<hr class="hr1">
					</div>
				
					<div id="content-detail" class="content-detail">
						<span class="pro-detail">${dto.getPro_cont() }</span>
					</div>
				
				</c:if>
				
				<%-- 리뷰 --%>
				<div id="review" class="cont-reivew">
					<span class="table-title">후기</span>
					
					<c:if test="${!empty review }">
					<span class="review-star"><fmt:formatNumber value="${star / rtotal }" pattern="#.#" /> / 5</span>
					<span class="review-number"><c:if test="${rtotal > 0 }">(${rtotal }개 후기)</c:if></span>
					</c:if>
					
					<div class="photo-only">
						<input id="photo-only" type="checkbox" onchange="showPhoto();">
						사진 후기만 보기
					</div>
					
					<hr class="hr2">
					
					<div id="review-all">
						<c:if test="${!empty review }">
						<ul class="cont-li">
						
						<c:forEach items="${review }" var="dto" varStatus="status">
							<li>
								<div class="review">	
									<div class="review-wrap">	
										<span class="personal-star">
											<c:forEach begin="1" end="${dto.getReview_star() }" ><i class="fas fa-star star-selected"></i></c:forEach><c:forEach begin="1" end="${5-dto.getReview_star() }" ><i class="fas fa-star star-deseleted"></i></c:forEach>
										</span>&nbsp;
										<span class="mem-id">
											<c:if test="${dto.getReview_writer() ne session_id && session_id ne 'admin' }">${dto.getReview_writer().substring(0,3) }****</c:if>
											<c:if test="${dto.getReview_writer() eq session_id || session_id eq 'admin' }">${dto.getReview_writer() }</c:if>
										</span> <br>
										<div id="review-${status.index }" class="review-div">
											<div class="cont-div"><span class="review-cont"><a href="javascript:void(0);" onclick="showReview(${status.index });"><c:out value="${dto.getReview_cont() }" /></a></span></div>
										
											<div class="review-imgs">
												<c:if test="${!empty dto.getReview_img() }">
													<a href="javascript:void(0);" onclick="showReview(${status.index });"><img class="list-img" src="resources/img/upload/${dto.getReview_img() }"></a>
												</c:if>
											</div>
										</div>
									
										<div id="review-detail-${status.index }" style="display:none;">
											<span class="review-detail-cont"><a href="javascript:void(0);" onclick="showReview(${status.index });"><c:out value="${dto.getReview_cont() }" /></a></span>
											<div class="review-detail-img">
												<c:if test="${!empty dto.getReview_img() }">
													<a href="javascript:void(0);" onclick="showReview(${status.index });"><img src="resources/img/upload/${dto.getReview_img() }"></a>
												</c:if>									
											</div>
										</div>
										
									</div>
								</div>
							</li>
						</c:forEach>
						</ul>
						</c:if>
						<c:if test="${empty review }" >
							<div style="text-align:center; font-size: 15px;">작성된 후기가 없습니다.</div>
						</c:if>
						
						<hr class="hr2">
						
						<%-- pagination --%>
						<div class="pagination">
							<c:if test="${rpage.getPage() > rpage.getBlock() }">
								<a href="product_cont.do?no=${cont.getPro_no() }&rpage=1#review">◀◀</a>
				   				<a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getStartBlock() - 1 }#review">◀</a>
							</c:if>
							
							<c:forEach begin="${rpage.getStartBlock() }" end="${rpage.getEndBlock() }" var="i">
						      <c:if test="${i == rpage.getPage() }">
						         <b><a href="product_cont.do?no=${cont.getPro_no() }&rpage=${i }#review">${i }</a></b>
						      </c:if>
						      
						      <c:if test="${i != rpage.getPage() }">
						         <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${i }#review">${i }</a>
						      </c:if>
						   </c:forEach>
						   
						   <c:if test="${rpage.getEndBlock() < rpage.getAllPage() }">
						      <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getEndBlock() +1 }#review">▶</a>
						      <a href="product_cont.do?no=${cont.getPro_no() }&rpage=${rpage.getAllPage() }#review">▶▶</a>
						   </c:if>
							
						</div>
					</div>
				
					<div id="review-photo" hidden>
						<c:if test="${!empty photo }">
						<ul class="cont-li">
						
						<c:forEach items="${photo }" var="dto" varStatus="status">
							<li>
								<div class="review">	
									<div class="review-wrap">	
										<span class="personal-star">
											<c:forEach begin="1" end="${dto.getReview_star() }" ><i class="fas fa-star star-selected"></i></c:forEach><c:forEach begin="1" end="${5-dto.getReview_star() }" ><i class="fas fa-star star-deseleted"></i></c:forEach>
										</span> &nbsp;
										<span class="mem-id">
											<c:if test="${dto.getReview_writer() ne session_id && session_id ne 'admin' }">${dto.getReview_writer().substring(0,3) }****</c:if>
											<c:if test="${dto.getReview_writer() eq session_id || session_id eq 'admin' }">${dto.getReview_writer() }</c:if>
										</span> <br>
										
										<div id="reviews-${status.index }" class="review-div">
											<div class="cont-div"><span class="review-cont" class="review-cont"><a href="javascript:void(0);" onclick="showReview(${status.index });"><c:out value="${dto.getReview_cont() }" /></a></span></div>
										
											<div class="review-imgs">
												<c:if test="${!empty dto.getReview_img() }">
													<a href="javascript:void(0);" onclick="showReview(${status.index });"><img class="list-img" src="resources/img/upload/${dto.getReview_img() }"></a>
												</c:if>
											</div>
										</div>
									
										<div id="reviews-detail-${status.index }" style="display:none;">
											<span class="review-cont" style="white-space:pre;"><a href="javascript:void(0);" onclick="showReview(${status.index });"><c:out value="${dto.getReview_cont() }" /></a></span>
											<div class="review-img">
												<c:if test="${!empty dto.getReview_img() }">
													<a href="javascript:void(0);" onclick="showReview(${status.index });"><img src="resources/img/upload/${dto.getReview_img() }"></a>
												</c:if>									
											</div>
										</div>
										
									</div>
								</div>
							</li>
						</c:forEach>
						</ul>
						</c:if>
						<c:if test="${empty photo }">
							<div style="text-align:center;">작성된 후기가 없습니다.</div>
						</c:if>
						
						<hr class="hr2">
						
						<%-- pagination --%>
						<div class="pagination">
							<c:if test="${ppage.getPage() > ppage.getBlock() }">
								<a href="product_cont.do?no=${cont.getPro_no() }&ppage=1#review">◀◀</a>
				   				<a href="product_cont.do?no=${cont.getPro_no() }&ppage=${ppage.getStartBlock() - 1 }#review">◀</a>
							</c:if>
							
							<c:forEach begin="${ppage.getStartBlock() }" end="${ppage.getEndBlock() }" var="i">
						      <c:if test="${i == ppage.getPage() }">
						         <b><a href="product_cont.do?no=${cont.getPro_no() }&ppage=${i }#review">${i }</a></b>
						      </c:if>
						      
						      <c:if test="${i != ppage.getPage() }">
						         <a href="product_cont.do?no=${cont.getPro_no() }&ppage=${i }#review">${i }</a>
						      </c:if>
						   </c:forEach>
						   
						   <c:if test="${ppage.getEndBlock() < ppage.getAllPage() }">
						      <a href="product_cont.do?no=${cont.getPro_no() }&ppage=${ppage.getEndBlock() +1 }#review">▶</a>
						      <a href="product_cont.do?no=${cont.getPro_no() }&ppage=${ppage.getAllPage() }#review">▶▶</a>
						   </c:if>
							
						</div>
					</div>
				</div>
				
				<%-- 질문 Q&A --%>
				<div id="qna" class="cont-board">
					<span class="table-title">Q&A</span>
					<button class="write pro-name" onclick="writeQna(${cont.getPro_no() });">상품 Q&A 작성하기</button>
					<table class="qna-table">
						<c:if test="${!empty qna }">
						<tr>
							<th class="qna-state">답변상태</th>
							<th class="qna-title">제목</th>
							<th class="qna-writer">글쓴이</th>
							<th class="qna-date">등록일</th>
						</tr>
						
						<c:forEach items="${qna }" var="dto" varStatus="status">
						<tr class="qna_tr">
							<td class="qna-state">
								<c:if test="${!empty dto.getQnaDTO() }"><span class="state-ok">답변완료</span></c:if> 
								<c:if test="${empty dto.getQnaDTO() }"><span class="state-no">답변대기</span></c:if> 
							</td>
							<td class="qna-title">
								<c:if test="${dto.getQna_writer() eq session_id || session_id eq 'admin' }">
									<a class="${status.index }" href="javascript:void(0);" onclick="show(${status.index});">${dto.getQna_title() } <c:if test="${dto.getQna_secret() eq 1 }"><i class="fas fa-lock"></i></c:if></a>
								</c:if>
									
								<c:if test="${dto.getQna_writer() ne session_id && session_id ne 'admin' && dto.getQna_secret() eq 0 }"><a class="${status.index }" href="javascript:void(0);" onclick="show(${status.index});">${dto.getQna_title() }</a></c:if>
								<c:if test="${dto.getQna_writer() ne session_id && session_id ne 'admin' && dto.getQna_secret() eq 1 }">상품관련 문의입니다. <c:if test="${dto.getQna_secret() eq 1 }"><i class="fas fa-lock"></i></c:if></c:if>
							</td>
							<td class="qna-writer">
								<c:if test="${dto.getQna_writer() ne session_id && session_id ne 'admin' }">${dto.getQna_writer().substring(0,3) }****</c:if>
								<c:if test="${dto.getQna_writer() eq session_id || session_id eq 'admin' }">${dto.getQna_writer() }</c:if>
							</td>
							<td class="qna-date">
								<fmt:parseDate value="${dto.getQna_date() }" pattern="yyyy-MM-dd HH:mm:ss" var="date" />
								<fmt:formatDate value="${date }" pattern="yyyy.MM.dd" />
							</td>
						</tr>
						
						<tr class="qna-detail-${status.index } qna-ans" style="display:none;">
							<td class="qna-state"></td>
							<td class="qna-title">
								<div>
									<span class="qna-cont"><c:out value="${dto.getQna_cont() }" /></span><br>
									
									<div class="qna-btn">
										<c:if test="${dto.getQna_writer() eq session_id || session_id eq 'admin' }">
											<button onclick="modifyQna(${dto.getQna_no() },${cont.getPro_no() });">수정</button>
											<button onclick="deleteQna(${dto.getQna_no() },${cont.getPro_no() });">삭제</button>
										</c:if>
									
										<c:if test="${session_id eq 'admin' }"><button onclick="answerQna(${dto.getQna_no() },${cont.getPro_no() });">답변하기</button></c:if>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						
						<c:if test="${!empty dto.getQnaDTO() }">
						<tr class="qna-detail-${status.index } qna-ans" style="display:none;">
							<td class="qna-state"></td>
							<td class="qna-title">
								<div class="qna-answer-wrapper">
									<div class="qna-answer-title">
										<span class="answer-tag">답변</span>
									</div>
									<div class="qna-detail qna-answer">
										<span class="qna-cont"><c:out value="${dto.getQnaDTO().getQna_cont() }" /></span><br>
										<div class="qna-btn">
											<c:if test="${session_id eq 'admin' }">
												<button onclick="modifyQna(${dto.getQnaDTO().getQna_no() },${cont.getPro_no() });">수정</button>
												<button onclick="deleteQna(${dto.getQnaDTO().getQna_no() },${cont.getPro_no() });">삭제</button>
											</c:if>
										</div>
									</div>
								</div>
							</td>
							<td class="qna-writer">관리자</td>
							<td class="qna-date">
								<fmt:parseDate value="${dto.getQna_date() }" pattern="yyyy-MM-dd HH:mm:ss" var="date" />
								<fmt:formatDate value="${date }" pattern="yyyy.MM.dd" />
							</td>
						</tr>
						</c:if>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${empty qna }">
							<tr>
								<td class="no-qna">작성된 질문이 없습니다.</td>
							</tr>
						</c:if>
						
					</table>
					
					<br>
					
					<%-- pagination --%>
					<div class="pagination">
						<c:if test="${qpage.getPage() > qpage.getBlock() }">
							<a href="product_cont.do?no=${cont.getPro_no() }&qpage=1#qna">◀◀</a>
			   				<a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getStartBlock() - 1 }#qna">◀</a>
						</c:if>
						
						<c:forEach begin="${qpage.getStartBlock() }" end="${qpage.getEndBlock() }" var="i">
					      <c:if test="${i == qpage.getPage() }">
					         <b><a href="product_cont.do?no=${cont.getPro_no() }&qpage=${i }#qna">${i }</a></b>
					      </c:if>
					      
					      <c:if test="${i != qpage.getPage() }">
					         <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${i }#qna">${i }</a>
					      </c:if>
					   </c:forEach>
					   
					   <c:if test="${qpage.getEndBlock() < qpage.getAllPage() }">
					      <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getEndBlock() +1 }#qna">▶</a>
					      <a href="product_cont.do?no=${cont.getPro_no() }&qpage=${qpage.getAllPage() }#qna">▶▶</a>
					   </c:if>
						
					</div>
				</div>
				</div>
				<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
				</div><%-- product-cont end --%>
			</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/product.js"></script>
<script type="text/javascript">

<%ProductDTO dto = (ProductDTO)request.getAttribute("cont");%>

function count(type) {
	let text = document.getElementById('cart_amount').value;
	 
	if(type == 'plus'){
		document.getElementById('cart_amount').value = parseInt(text) + 1;
	}else if(type == 'minus' && text > 1) {
		document.getElementById('cart_amount').value = parseInt(text) - 1;
	}
	
	total();
}

function total() {
	 
	let price = <%=dto.getPro_output_price() %>;
	let amount = document.getElementById('cart_amount').value;
	
	if(amount < 1) {
		amount = 1;
		document.getElementById('cart_amount').value = amount;
	}
	let total = String(parseInt(price) * parseInt(amount)).replace(/(.)(?=(\d{3})+$)/g,'$1,');

	document.getElementById('total-price').innerText = total;
	document.getElementById('total-amount').innerText = amount;
}

function likeCheck(product_no){
	if('${session_id}' == ''){
		if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
			window.open("login_popup.do", "로그인", "_blank");
			return;
		}
	}else{
		addLike(product_no);
	}
}

function writeQna(product_no) {
	if('${session_id}' != ''){
		window.open("product_qna_write.do?no="+product_no, "질문글 작성하기", "_blank");
	}else {
		if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
			window.open("login_popup.do", "로그인", "_blank");
			return;
		}
	}
}

function loginCheck(){
	console.log("check");
	if('${session_id}' == ''){
		if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
		window.open("login_popup.do", "로그인", "_blank");
		return;
		}
	}else {
		location.href='purchase.do';
	}
}
</script>
</html>