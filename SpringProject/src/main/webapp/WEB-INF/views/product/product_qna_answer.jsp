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
<title>울퉁불퉁's - 상품 Q&A 답변</title>
</head>
<body onload="window.resizeTo(400,600)">
	
	<div class="product-qna-form">
		<div class="history-title">
			상품 Q&A 답변
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
									<a href="<%=request.getContextPath() %>/product_cont.do?no=${pdto.getPro_no()}"><img src="resources/img/upload/${pdto.getPro_img() }"></a>
									
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
				
		<form action="product_qna_answer_ok.do">
			<input type="hidden" name="qna_pro" value="${pdto.getPro_no() }">
			<input type="hidden" name="qna_group" value="${qdto.getQna_no() }">
			
			<table border="1">
				<tr>
					<th>제 목</th>
					<td><input name="qna_title" value="문의 답변드립니다." required></td>
				</tr>
				<tr>
					<th>문의 내용</th>
					<td><span class="qna-cont" style="white-space:pre;"><c:out value="${qdto.getQna_cont() }" /></span></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="qna_cont" rows="15" cols="50" required></textarea></td>
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
						<input type="button" value="취소" onclick="window.close();">
						<input type="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		
		<br>
		
		<div class="qna-caution">
			
		</div>
	</div>

</body>
</html>