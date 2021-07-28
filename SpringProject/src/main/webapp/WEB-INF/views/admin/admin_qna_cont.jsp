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
		
			<div class="main">	
			
			<div class="amdin-title">문의사항</div>

			<!-- 내용 시작 -->
			<div align="center">
				<c:set var="dto" value="${Admin_Inquiry }" />
				<c:if test="${!empty dto }">
					<h3>${dto.getQna_writer() }님 문의내역</h3>
					<hr width="50%" color="tomato">
					<br>
					

					<table border="1" cellspacing="0" width="700">
						<tr>
							<th>작성자</th>
							<td>${dto.getQna_writer() }</td>
						</tr>
						<tr>
							<th>상품 번호</th>
							<td>${dto.getQna_pro() }</td>
						</tr>
						<tr>
							<th>작성일자</th>
							<td>${dto.getQna_date().substring(0,10) }</td>
						</tr>

						<tr>
							<th>글 제목</th>
							<td>${dto.getQna_title() }</td>
						</tr>

						<tr>
							<th>글내용</th>
							<td>${dto.getQna_cont() }</td>
						</tr>
						</c:if>

						<c:if test="${empty dto }">
							<tr>
								<td colspan="2" align="center">
									<h3>문의사항이 존재하지 않습니다.</h3>
								</td>
							</tr>
						</c:if>

					</table>
						<tr>
							<td colspan="4" align="right">
							<input type="button" value="전체 문의 목록" onclick="location.href='admin_qna_list.do'">
							
							</td>
						</tr>
				</div>
			</div>
		</div>
	</div>
</body>
</html>