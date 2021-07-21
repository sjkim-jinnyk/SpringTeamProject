<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>



	<!-- <div class="wrapper d-flex align-items-stretch"> -->
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4 pt-5">
				<h1>
					<a href="<%=request.getContextPath() %>/admin_list.do" class="logo">관리자</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li class="active"><a href="#homeSubmenu"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle" onclick="admin_product_list.do">상품 관리</a>
						<ul class="collapse list-unstyled" id="homeSubmenu">
							<li><a href="admin_product_list.do">상품 관리</a></li>
							<li><a href="product_insert.do">상품 등록</a></li>
							<li><a href="category_list.do">카테고리 관리</a></li>
							<li><a href="#">상품 삭제</a></li>
						</ul></li>
					<li><a href="#">쿠폰 발행</a></li>

					<li><a href="#pageSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">게시판</a>
						<ul class="collapse list-unstyled" id="pageSubmenu">
							<li><a href="#">문의 사항</a></li>
							<li><a href="#">공지사항</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/main.do">UTBT</a></li>
				</ul>
			</div>
		</nav>

	<!-- </div> -->
	

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/popper.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>