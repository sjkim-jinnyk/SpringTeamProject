<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

			<!-- 내용 시작 -->
			<div align="center">
				<h3>문의사항</h3>
				<br>
				
				<table class="table table-hover">
					<tr>
						<th>작성자</th>
						<th>상품 번호</th>
						<th>글 제목</th>
						<th>작성일자</th>
					</tr>

					<c:set var="list" value="${QnsList }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td><a
									href="<%=request.getContextPath() %>/admin_qna_Inquiry.do?no=${dto.getQna_no()}&page=${Paging.getPage()}">
										${dto.getQna_writer() }</a></td>
								<td>${dto.getQna_pro() }</td>
								<td>${dto.getQna_title() }</td>
								<td>${dto.getQna_date().substring(0,10) }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<br> <br>

				<%-- Pagination --%>
				<div class="pagination">
					<c:if test="${page.getPage() > page.getBlock() }">
						<a href="admin_qna_list.do?page=1">◀◀</a>
						<a href="admin_qna_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
					</c:if>

					<c:forEach begin="${page.getStartBlock() }"
						end="${page.getEndBlock() }" var="i">
						<c:if test="${i == page.getPage() }">
							<b><a href="admin_qna_list.do?page=${i }">${i }</a></b>
						</c:if>

						<c:if test="${i != page.getPage() }">
							<a href="admin_qna_list.do?page=${i }">${i }</a>
						</c:if>
					</c:forEach>

					<c:if test="${page.getEndBlock() < page.getAllPage() }">
						<a href="admin_qna_list.do?page=${page.getEndBlock() +1 }">▶</a>
						<a href="admin_qna_list.do?page=${page.getAllPage() }">▶▶</a>
					</c:if>
				</div>
			</div>

			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>