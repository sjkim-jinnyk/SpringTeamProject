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
<script type="text/javascript" src="resources/js/admin.js"></script>
<title>울퉁불퉁's 관리자 - 상품 목록</title>
</head>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
	
			<div class="search">
				<form method="post" action="admin_product_search.do">		
					<select id="field" name="field" onchange="check();">
						<option value="name">상품명</option>
						<option value="category">카테고리</option>
						<option value="state">판매상태</option>
						<option value="tag">태그</option>
					</select>
					
					<select id="category" name="cateWord" style="display:none;">
						<c:if test="${empty category }">
							<option value="">:::카테고리 없음:::</option>
						</c:if>
						<c:if test="${!empty category }">
							<c:forEach items="${category }" var="dto">
								<option value="${dto.getCate_no() }">${dto.getCate_name() }[${dto.getCate_no() }]</option>
							</c:forEach>
						</c:if>
					</select>
					
					<select id="state" name="stateWord" style="display:none;">
						<option value="y">판매중</option>
						<option value="n">미판매</option>
					</select>
					
					<input id="search" type="search" name="allWord" placeholder="${keyword }">
					<input type="submit" value="검색"> 
				</form>
			</div>
			
			<div class="admin-product">
				<button onclick="location.href='category_list.do'">카테고리 관리</button>
				<button onclick="location.href='product_insert.do'">상품 등록</button>
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
								<c:if test="${dto.getPro_check() eq 'y' }"><span class="for-sale">판매중</span></c:if>
								<c:if test="${dto.getPro_check() eq 'n' }"><span class="not-for-sale">미판매</span></c:if>
							</td>
							<td><a href="product_cont.do?no=${dto.getPro_no() }">[click]</a></td>
							<td>
								<button onclick="location.href='product_update.do?no=${dto.getPro_no()}'">수정</button><br>
								<button onclick="deletePro(${dto.getPro_no()}, '${dto.getPro_name() }');">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty List }">
				<tr>
					<td>등록된 상품이 없습니다.</td>
				</tr>
				</c:if>
				</table>
			</div>
			
			<%-- Pagination --%>	
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
		
				
			
			</div>
			
		</div>
	</div>
	
</body>
</html>