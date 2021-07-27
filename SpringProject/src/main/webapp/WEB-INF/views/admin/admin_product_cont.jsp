<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>울퉁불퉁's 관리자 - ${dto.getPro_name() }</title>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
			
			<div class="amdin-title">상품 정보</div>
	
				<div class="admin-product-cont">
					<table class="admin-pro-cont">
					<c:if test="${!empty dto }">
						<tr>
							<th>상품명</th>
							<td>${dto.getPro_name() }&nbsp;
								<c:if test="${dto.getPro_check() eq 'y' }"><span class="for-sale">판매중</span></c:if>
								<c:if test="${dto.getPro_check() eq 'n' }"><span class="not-for-sale">미판매</span></c:if>
							</td>
							<td rowspan="6" class="cont-img"><img src="resources/img/upload/${dto.getPro_img() }"></td>
						</tr>
						<tr>
							<th>상품번호</th>
							<td>${dto.getPro_no() }</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>${cdto.getCate_name() }[${cdto.getCate_no() }]</td>
						</tr>
						<tr>
							<th>입고가</th>
							<td><fmt:formatNumber value="${dto.getPro_input_price() }" /> 원 </td>
						</tr>
						<tr>
							<th>출고가</th>
							<td><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원 </td>
						</tr>
						<tr>
							<th>태그</th>
							<td>
								<c:forEach items="${dto.getPro_tags() }" var="tags"><span class="cont-tag">${tags }</span>&nbsp;</c:forEach>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td colspan="4"><div class="pro-cont">${dto.getPro_cont() }</div></td>
						</tr>
						<tr>
							
						</tr>
						<tr>
							<td colspan="4">
								<button class="default-btn" onclick="location.href='admin_product_list.do'">상품목록</button>
								<div class="btn-wrap">
									<button class="pro-cont-btn update-btn" onclick="location.href='product_update.do?no=${dto.getPro_no() }'">수정</button>
									<button class="pro-cont-btn delete-btn" onclick="deletePro(${dto.getPro_no()}, '${dto.getPro_name() }');">삭제</button>
								</div>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${empty dto }">
						조회된 상품이 없습니다.
					</c:if>
					</table>
				</div>
				<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript" src="resources/js/admin.js"></script>
</html>