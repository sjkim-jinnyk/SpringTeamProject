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
<title>울퉁불퉁's 관리자 - 상품 목록</title>
</head>
<body onload="check();">
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
			
			<div class="amdin-title">상품 관리</div>
		
			<div class="search">
				<form method="post" action="admin_product_search.do">		
					<select id="field" name="field" onchange="check();">
						<option value="name" <c:if test="${field eq 'name' }">selected</c:if>>상품명</option>
						<option value="category" <c:if test="${field eq 'category' }">selected</c:if>>카테고리</option>
						<option value="state" <c:if test="${field eq 'state' }">selected</c:if>>판매상태</option>
						<option value="tag" <c:if test="${field eq 'tag' }">selected</c:if>>태그</option>
					</select>
					
					<select id="category" name="cateWord" style="display:none;">
						<c:if test="${empty category }">
							<option value="">:::카테고리 없음:::</option>
						</c:if>
						<c:if test="${!empty category }">
							<c:forEach items="${category }" var="dto">
								<option value="${dto.getCate_no() }" <c:if test="${keyword eq String.valueOf(dto.getCate_no()) }">selected</c:if>>${dto.getCate_name() }[${dto.getCate_no() }]</option>
							</c:forEach>
						</c:if>
					</select>
					
					<select id="state" name="stateWord" style="display:none;">
						<option value="y" <c:if test="${keyword eq 'y' }">selected</c:if>>판매중</option>
						<option value="n" <c:if test="${keyword eq 'n' }">selected</c:if>>미판매</option>
					</select>
					
					<input id="search" type="search" name="allWord" placeholder="${keyword }">
					<button type="submit"><i class="fas fa-search"></i></button> 
				</form>
			</div>
			
			<div class="admin-product">
				<table class="admin-product-list">
					<tr>
						<th>상품 번호</th>
						<th>카테고리</th>
						<th colspan="2">상품명</th>
						<th>입고가</th>
						<th>출고가</th>
						<th>상태</th>
						<th>판매페이지</th>
						<th></th>
					</tr>
				<c:if test="${!empty List }">
					<c:forEach items="${List }" var="dto" varStatus="status">
						<tr class="pro-wrap">
							<td>${dto.getPro_no() }</td>
							<td><a href="admin_product_search.do?field=category&cateWord=${cList[status.index].getCate_no() }">${cList[status.index].getCate_name() }[${cList[status.index].getCate_no() }]</a></td>
							<td><a href="admin_product_cont.do?no=${dto.getPro_no()}"><img src="resources/img/upload/${dto.getPro_img() }"></a></td>
							<td class="pro_name">
								<c:forEach items="${dto.getPro_tags() }" var="tags">
									<a class="pro-tag" href="admin_product_search.do?field=tag&allWord=${tags }">${tags }</a> 
								</c:forEach><br>
								<a href="admin_product_cont.do?no=${dto.getPro_no()}">${dto.getPro_name() }</a>
							</td>
							<td class="pro-price"><fmt:formatNumber value="${dto.getPro_input_price() }" /> 원</td>
							<td class="pro-price"><fmt:formatNumber value="${dto.getPro_output_price() }" /> 원</td>
							<td>
								<c:if test="${dto.getPro_check() eq 'y' }">
									<a href="admin_product_search.do?field=state&stateWord=y"><span class="for-sale">판매중</span></a>
								</c:if>
								<c:if test="${dto.getPro_check() eq 'n' }">
									<a href="admin_product_search.do?field=state&stateWord=n"><span class="not-for-sale">미판매</span></a>
								</c:if>
							</td>
							<td><a class="click" href="product_cont.do?no=${dto.getPro_no() }">[click]</a></td>
							<td>
								<button class="update-btn" onclick="location.href='product_update.do?no=${dto.getPro_no()}'">수정</button>
								<button class="delete-btn" onclick="deletePro(${dto.getPro_no()}, '${dto.getPro_name() }');">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty List }">
				<tr>
					<td colspan="9">등록된 상품이 없습니다.</td>
				</tr>
				</c:if>
				</table>
			</div>
			
			<%-- Pagination --%>	
			
			<c:if test="${empty keyword }">
			<div class="pagination">
				<c:if test="${page.getPage() > page.getBlock() }">
					<a href="admin_product_list.do?page=1">◀◀</a>
	   				<a href="admin_product_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
				</c:if>
				
				<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
			      <c:if test="${i == page.getPage() }">
			         <b><a href="admin_product_list.do?page=${i }">${i }</a></b>
			      </c:if>
			      
			      <c:if test="${i != page.getPage() }">
			        <a href="admin_product_list.do?page=${i }">${i }</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${page.getEndBlock() < page.getAllPage() }">
			      <a href="admin_product_list.do?page=${page.getEndBlock() +1 }">▶</a>
			      <a href="admin_product_list.do?page=${page.getAllPage() }">▶▶</a>
			   </c:if>
			</div>
			</c:if>
			
			<c:if test="${!empty keyword }">
			<div class="pagination">
				<c:if test="${page.getPage() > page.getBlock() }">
					<a href="admin_product_search.do?page=1&field=${field }&keyword=${keyword}">◀◀</a>
	   				<a href="admin_product_search.do?page=${Paging.getStartBlock() - 1 }&field=${field }&keyword=${keyword}">◀</a>
				</c:if>
				
				<c:forEach begin="${page.getStartBlock() }" end="${page.getEndBlock() }" var="i">
			      <c:if test="${i == page.getPage() }">
			         <b><a href="admin_product_search.do?page=${i }&field=${field }&keyword=${keyword}">${i }</a></b>
			      </c:if>
			      
			      <c:if test="${i != page.getPage() }">
			         <a href="admin_product_search.do?page=${i }&field=${field }&keyword=${keyword}">${i }</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${page.getEndBlock() < page.getAllPage() }">
			      <a href="admin_product_search.do?page=${page.getEndBlock() +1 }&field=${field }&keyword=${keyword}">▶</a>
			      <a href="admin_product_search.do?page=${page.getAllPage() }&field=${field }&keyword=${keyword}">▶▶</a>
			   </c:if>
			</div>
			</c:if>
		
				
			<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript" src="resources/js/admin.js"></script>
</html>