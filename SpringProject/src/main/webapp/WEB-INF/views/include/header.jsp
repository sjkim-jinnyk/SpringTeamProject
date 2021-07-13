<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/include.css">
<title>Insert title here</title>
</head>
<body>

	<div class="layout_container">
		
		<div class="header_desktop header">
			
			<div class="menu_list_right">
				<a href="<%=request.getContextPath()%>/about.do">ABOUT</a>
				<a href="<%=request.getContextPath()%>/product_list.do">SHOP</a>
				<a href="<%=request.getContextPath()%>/review_list.do">REVIEW</a>
				<a href="<%=request.getContextPath() %>/admin_list.do">관리자</a>
			</div>
			

			<a href="<%=request.getContextPath()%>/main.do" class="site_logo">[LOGO]</a>
			
			<div class="menu_list_left">
				<a href="<%=request.getContextPath()%>/search_list.do">검색</a>
				<a href="<%=request.getContextPath()%>/login.do">LOGIN</a>
				<a href="<%=request.getContextPath()%>/cart.do">장바구니</a>
			</div>
			
		</div>
		
	</div>

</body>
</html>