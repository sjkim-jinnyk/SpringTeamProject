<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/product.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">

			<div align="center">

				<div class="main">	
			
				<div class="amdin-title">회원 목록</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover">
							<tr>
								<th>회원성명</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>가입일자</th>
							</tr>

							<c:set var="list" value="${searchList }" />
							<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto">
									<tr>
										<td><a
											href="<%=request.getContextPath() %>/admin_detail.do?no=${dto.getMem_no()}">
												${dto.getMem_name() }</a></td>
										<td>${dto.getMem_phone() }</td>
										<td>${dto.getMem_addr() }</td>
										<td>${dto.getMem_regdate().substring(0,10) }</td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${empty list }">
								<tr>
									<td colspan="4" align="center">
										<h3>검색된 회원이 없습니다.</h3>
									</td>
								</tr>
							</c:if>

							<%-- Pagination --%>
							<div class="pagination">
								<c:if test="${page.getPage() > page.getBlock() }">
									<a href="admin_search.do?page=1&keyword=${keyword}">◀◀</a>
									<a
										href="admin_search..do?page=${Paging.getStartBlock() - 1 }&keyword=${keyword}">◀</a>
								</c:if>

								<c:forEach begin="${page.getStartBlock() }"
									end="${page.getEndBlock() }" var="i">
									<c:if test="${i == page.getPage() }">
										<b><a
											href="admin_search..do?page=${i }&keyword=${keyword}">${i }</a></b>
									</c:if>

									<c:if test="${i != page.getPage() }">
										<a href="admin_search..do?page=${i }&keyword=${keyword}">${i }</a>
									</c:if>
								</c:forEach>

								<c:if test="${page.getEndBlock() < page.getAllPage() }">
									<a
										href="admin_search..do?page=${page.getEndBlock() +1 }&keyword=${keyword}">▶</a>
									<a
										href="admin_search..do?page=${page.getAllPage() }&keyword=${keyword}">▶▶</a>
								</c:if>

							</div>

							<tr>
								<td colspan="4" align="right"><input type="button" class="default-btn"
									value="회원목록" onclick="location.href='admin_list.do'"></td>
							</tr>
						</table>
						<br> <br>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>