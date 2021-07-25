<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
<link rel="stylesheet" href="resources/css/main.css?after">
<title>UTBT</title>
</head>
<body>

	
	<div class="layout_container">
		
		<jsp:include page="include/header.jsp"/>
		
			<!-- http://hong.adfeel.info/frontend/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-%EC%98%88%EC%A0%9C/ -->
			<div class="slide">
				
				<ul class="panel">
					<li><img src="resources/img/main/slide_img_1.jpeg"></li>
					<li><img src="resources/img/main/slide_img_2.jpeg"></li>
					<li><img src="resources/img/main/slide_img_3.jpeg"></li>
				</ul>
				<ul class="dot">
					<li class="on">슬라이드 버튼1번</li>
					<li>슬라이드 버튼2번</li>
					<li>슬라이드 버튼3번</li>
				</ul>
				
				<div class="prev"><img src="resources/img/main/slide_left.png"></div>
				<div class="next"><img src="resources/img/main/slide_right.png"></div>
				
			</div>
			
			<div class="main">
				<div class="content">
					<div class="cont_box"></div>
					<div class="cont_box"></div>
					<div class="cont_box"></div>
				</div>
			</div>
			
		<jsp:include page="include/footer.jsp" />
		
	</div>

</body>
</html>

