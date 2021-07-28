<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/coupon.css">
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/header.jsp" />
		<div class="main">

			<h1>결제 실패</h1>
			
			<div class="a_container">
				<a href="<%=request.getContextPath()%>/main.do">메인 화면으로 가기</a>
			</div>

		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
</body>
</html>