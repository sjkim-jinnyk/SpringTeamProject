<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon create</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
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
			
			<div class="amdin-title">쿠폰 발행</div>

			<!-- 내용 시작 -->
			<div align="center">

				<form method="post" action="create_coupon_ok.do">
					<table class="table table-bordered">
						<tr>
							<th>쿠폰번호</th>
							<td><input name="coupon_no" type="text" ></td>
						</tr>

						<tr>
							<th>쿠폰 코드</th>
							<td><input name="coupon_code" type="text" ></td>
						</tr>

						<tr>
							<th>쿠폰 할인률</th>
							<td><input name="coupon_type" type="text" ></td>
						</tr>

						<tr>
							<th>쿠폰 상세 내용</th>
							<td><input name="coupon_cont" type="text" ></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
							<input class="default-btn" type="reset"	value="다시작성">&nbsp;&nbsp; 
							<input class="update-btn" type="submit" value="쿠폰생성"></td>
						</tr>
					</table>
				</form>


			</div>
			</div>
		</div>
	</div>
</body>
</html>