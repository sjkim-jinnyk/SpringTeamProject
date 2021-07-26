<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/admin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>울퉁불퉁's 관리자 - ${dto.getPro_name() }</title>
</head>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
	
			<div class="admin-product-cont">
				<table>
				<c:if test="${!empty dto }">
					<tr>
						<th>상품번호</th>
						<td>${dto.getPro_no() }</td>
						<th>상태</th>
						<td>
							<c:if test="${dto.getPro_check() eq 'y' }">판매중</c:if>
							<c:if test="${dto.getPro_check() eq 'n' }">미판매</c:if>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${cdto.getCate_name() }[${cdto.getCate_no() }]</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${dto.getPro_name() }</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>상품 대표이미지</th>
						<td><img src="resources/img/upload/${dto.getPro_img() }"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>입고가</th>
						<td><fmt:formatNumber value="${dto.getPro_input_price() }" /> 원 </td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>출고가</th>
						<td><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원 </td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>태그</th>
						<td>
							<c:forEach items="${dto.getPro_tags() }" var="tags"><span class="pro-tag">${tags }</span></c:forEach>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td colspan="3"><span class="pro-cont">${dto.getPro_cont() }</td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td colspan="4">
							<button onclick="location.href='admin_product_list.do'">상품목록</button>
							<button onclick="location.href='product_update.do?no=${dto.getPro_no() }'">수정</button>
							<button onclick="deletePro(${dto.getPro_no()}, '${dto.getPro_name() }');">삭제</button>
						</td>
					</tr>
				</c:if>
				
				<c:if test="${empty dto }">
					조회된 상품이 없습니다.
				</c:if>
				</table>
			</div>
			
				
			
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript" src="resources/js/admin.js"></script>
</html>