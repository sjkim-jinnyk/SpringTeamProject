<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/CommonStyle.css">
<link rel="stylesheet" href="resources/css/product.css">
<title>울퉁불퉁's - 상품 Q&A 작성하기</title>
</head>
<body onload="window.resizeTo(500, 850); window.moveTo(500,100);">
	
	<div class="product-qna-form">
		<div class="form-title">
			상품 Q&A 작성하기
		</div>
		
		<table class="qna-product">
			<tr>
				<th class="qna-info">문의 상품 정보</th>
				<th class="qna-price">가격</th>
			</tr>
			<tr>
				<td>
					<div>
						<a href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}"><img src="resources/img/upload/${dto.getPro_img() }"></a>
									
						<div class="qna-pro-content">
							<c:forEach items="${dto.getPro_tags() }" var="tags">
								<a class="cart-tag" href="search_tag.do?k=${tags }">${tags }</a> 
							</c:forEach><br>
							<a class="pro-name" href="<%=request.getContextPath() %>/product_cont.do?no=${dto.getPro_no()}">${dto.getPro_name() }</a>
						</div>
					</div>
				</td>
				<td class="qna-price"><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원</td>
			</tr>
		</table>
				
		<form action="product_qna_write_ok.do">
			<input type="hidden" name="qna_pro" value="${dto.getPro_no() }">

			<table class="qna-form">
				<tr>
					<th>제목</th>
					<td><input name="qna_title" placeholder="제목을 입력하세요." value="" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="qna_cont" rows="8" placeholder="문의하실 내용을 입력하세요." required></textarea></td>
				</tr>
				<tr>
					<th>비밀글</th>
					<td><input name="qna_secret" value="1" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="qna-form-btn form-cancel" type="button" value="취소" onclick="window.close();">
						<input class="qna-form-btn form-submit" type="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
	<div class="qna-caution">
		- 문의하신 내용에 대한 답변은 해당 상품의 상세페이지 또는 '마이페이지>문의내역'에서 확인하실 수 있습니다.<br>
		- 상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.<br>
		- 전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.<br>
	</div>

</body>
</html>