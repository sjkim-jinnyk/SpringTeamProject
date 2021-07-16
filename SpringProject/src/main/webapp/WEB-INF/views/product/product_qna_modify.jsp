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
<title>울퉁불퉁's - 상품 Q&A 작성하기</title>
</head>
<body onload="window.resizeTo(400,600)">
	
	<div class="product-qna-form">
		<div class="history-title">
			상품 Q&A 작성하기
		</div>
				
				<div class="history-wrap">
					<hr>
					<ul>
						<li>
							<div class="history">
								<div class="pro-content">
									상품 정보
								</div>
								
								<div class="pro-price">
									가격
								</div>
							</div>
						</li>
						
						<c:if test="${!empty pdto }">
							<li>
							<form method="post">
								<input type="hidden" name="product_no" value="${pdto.getPro_no() }">
								<div class="history">
									<a href="<%=request.getContextPath() %>/product_cont.do?no=${pdto.getPro_no()}"><img src="resources/img/product/${pdto.getPro_img() }"></a>
									
									<div class="pro-content">
										<c:forEach items="${pdto.getPro_tags() }" var="tags">
											<a class="cont-info-tag" href="search_tag.do?k=${tags }">${tags }</a> 
										</c:forEach><br>
										<a href="<%=request.getContextPath() %>/product_cont.do?no=${pdto.getPro_no()}">${pdto.getPro_name() }</a>
									</div>
									
									<div class="pro-price">
										<fmt:formatNumber value="${pdto.getPro_output_price() }" /> 원
									</div>
								</div>
							</form>
							</li>
						</c:if>
					</ul>
				</div>
				
		<form action="product_qna_modify_ok.do">
			<input type="hidden" name="qna_no" value="${qdto.getQna_no() }">
			
			<table border="1">
				<tr>
					<th>제 목</th>
					<td><input name="qna_title" value="${qdto.getQna_title() }" required></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="qna_cont" rows="8" cols="50" required>${qdto.getQna_cont() }</textarea></td>
				</tr>
				<tr>
					<th>비공개</th>
					<td>
					<c:if test="${qdto.getQna_secret() eq 1 }"><input name="qna_secret" value="1" type="checkbox" checked="checked"></c:if>
					<c:if test="${qdto.getQna_secret() eq 0 }"><input name="qna_secret" value="1" type="checkbox"></c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						문의하신 내용에 대한 답변은 해당 상품의 상세페이지 또는 '마이페이지>문의내역'에서 확인하실 수 있습니다.
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="취소" onclick="window.close();">
						<input type="submit" value="수정">
					</td>
				</tr>
			</table>
		</form>
		
		<br>
		
		<div class="qna-caution">
			상품 Q&A는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.
상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.
전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.
상품에 대한 이용 후기는 리뷰에 남겨 주세요.
		</div>
	</div>

</body>
</html>