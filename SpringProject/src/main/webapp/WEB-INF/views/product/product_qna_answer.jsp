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
<link rel="stylesheet" href="resources/css/CommonStyle.css">
<title>울퉁불퉁's - 상품 Q&A 답변하기</title>
</head>
<body onload="window.resizeTo(500, 850); window.moveTo(500,100);">
	 
	<div class="product-qna-form">
		<div class="form-title">
			상품 Q&A 답변하기
		</div>
				
				<table class="qna-product">
			<tr>
				<th class="qna-info">문의 상품정보</th>
				<th class="qna-price">가격</th>
			</tr>
			<tr>
				<td>
					<div>
						<a href="<%=request.getContextPath() %>/product_cont.do?no=${pdto.getPro_no()}"><img src="resources/img/upload/${pdto.getPro_img() }"></a>
									
						<div class="qna-pro-content">
							<c:forEach items="${pdto.getPro_tags() }" var="tags">
								<a class="cart-tag" href="search_tag.do?k=${tags }">${tags }</a> 
							</c:forEach><br>
							<a class="pro-name" href="<%=request.getContextPath() %>/product_cont.do?no=${pdto.getPro_no()}">${pdto.getPro_name() }</a>
						</div>
					</div>
				</td>
				<td class="qna-price"><fmt:formatNumber value="${pdto.getPro_output_price() }" /> 원</td>
			</tr>
		</table>
				
		<form action="product_qna_answer_ok.do">
			<input type="hidden" name="qna_pro" value="${pdto.getPro_no() }">
			<input type="hidden" name="qna_group" value="${qdto.getQna_no() }">
			
			<fieldset class="fieldset">
			<legend>문의내용</legend>
			<div class="qna-origin">
				<span class="qna-origin-cont"><c:out value="${qdto.getQna_title() }" /></span>
				<hr class="qna-hr">
				<span class="qna-origin-cont"><c:out value=" ${qdto.getQna_cont() }" /></span>
			</div>
			</fieldset>
			
			<table class="qna-form">
				<tr>
					<th>제 목</th>
					<td><input name="qna_title" value="문의 답변드립니다." required></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="qna_cont" rows="8" required></textarea></td>
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
						<input class="qna-form-btn form-cancel" type="button" value="취소" onclick="window.close();">
						<input class="qna-form-btn form-submit" type="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
</body>
</html>