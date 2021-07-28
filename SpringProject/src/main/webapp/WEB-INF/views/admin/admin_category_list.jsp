<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>울퉁불퉁's 관리자 - 카테고리 목록</title>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
	
		<div class="main">
		
		<div class="amdin-title">카테고리 관리</div>
		
			<div class="admin-category">
					<table class="admin-cate-list">
						<tr>
							<th>번호</th>
							<th colspan="2">카테고리명</th>
						</tr>
						
						<c:if test="${!empty List }">
							<c:forEach items="${List }" var="dto" varStatus="status">
								<tr class="pro-wrap">
									<td><span id="cate-no-${status.index }">${dto.getCate_no() }</span></td>
									<td class="cate-name">
										<div id="cate-${status.index }" style="display: block;">${dto.getCate_name() }</div> 
										
										<div id="cate-update-${status.index }" style="display: none;">
											<input type="text" id="cate-name-${status.index }" name="cate_name" value="${dto.getCate_name() }" >
										</div>
									</td>
									<td class="cate-btn">
										<div id="btn-${status.index }" class="pro-btn-wrap">
											<button class="update-btn" onclick="makeCate(${status.index });">수정</button> 
											<button class="delete-btn" onclick="deleteCate(${dto.getCate_no() },'${dto.getCate_name() }');">삭제</button>
										</div>
										<div id="btn-update-${status.index }" class="pro-btn-wrap" style="display:none;">
											<button class="delete-btn" onclick="updateCate(${status.index});">등록</button> 
											<button class="default-btn" onclick="makeCate(${status.index });">취소</button> 
										</div>
									</td>
								</tr>
							
							</c:forEach>
						</c:if>
						
						<c:if test="${empty List }">
						<tr>
							<td colspan="3">등록된 카테고리가 없습니다.</td>
						</tr>
						</c:if>
					
					</table>
				<span class="info">* 카테고리 삭제 시 기존에 등록되어 있던 상품의 카테고리는 공란 처리됩니다.</span>
				
			</div>
			
			<div class="amdin-title">카테고리 등록</div>
			
			<div>
				<form method="post" action="category_insert.do">
					<table class="new-category">
						<tr>
							<th>카테고리명</th>
							<td><input name="cate_name"></td>
							<td><input class="update-btn" type="submit" value="등록"></td>
						</tr>					
					</table>
				</form>
			
			</div>
			<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
		</div>
		
		</div>
		
	</div>
</body>
<script type="text/javascript" src="resources/js/admin.js"></script>
</html>