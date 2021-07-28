<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
<link rel="stylesheet" href="resources/css/CommonStyle.css">
<link rel="stylesheet" href="resources/css/main.css?after">
<title>UTBT</title>
</head>
<body>

	
	<div class="layout_container">
		
		<jsp:include page="include/header.jsp"/>
		
			<!-- http://hong.adfeel.info/frontend/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-%EC%98%88%EC%A0%9C/ -->
			<div class="slide">
				
				<ul class="panel">
					<li>
						<img src="resources/img/main/vege_box5.jpg">
						<p class="t1">울퉁불퉁's</p>
						<p class="t2">친환경 못난이 채소박스</p>
						<p class="t3">키우는 정성은 똑같아요 </p>
						<p class="t4">못생겨도 맛은 좋아</p>
						<p class="p_btn"><a href="product_list.do">구독하기</a></p>
					</li>
					<li>
						<img src="resources/img/main/slide_img_2.jpeg">
						<p class="t1">전자렌지 3분 OK!</p>
						<p class="t2">오븐에 구운 감자</p>
						<p class="t3">크기가 작아도 괜찮아요</p>
						<p class="t4">쫄깃, 촉촉하게 구운 맛있는 한입 감자</p>
						<p class="p_btn"><a href="product_list.do">구매하기</a></p>
					</li>
					<li>
						<img src="resources/img/main/slide_img_3.jpeg">
						<p class="t1">먹고 싶은거</p>
						<p class="t2">다 해먹어</p>
						<p class="t3">한봉지 가격에 한박스를!</p>
						<p class="t4">가성비 높은 어글리 버섯</p>
						<p class="p_btn"><a href="product_list.do">구매하기</a></p>
					</li>
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
			
				<div class="content1">
					<div class=left>
						<div class="wrap0">
							<div class="wrap1">
								<div class="t1"><p>전체<br>생산량의</p></div>
								<div class="t2"><p>30%</p></div>
							</div>
							<div class="wrap2">
								<div class="t1"><p>전체<br>생산액 중</p></div>
								<div class="t2"><p>5조원</p></div>
							</div>
						</div>
						<div class="t3">
							<p>알고 계셨나요? 조금 작거나, 상처가 있거나,<br>
							못생겼다는 이유로 폐기되는 농산물이 전체<br>
							농산물 생산량의 30%에 이릅니다.</p>
							<p>돈으로 환산하면 최대 5조원 어치가 낭비되고 있어요.</p>
							<p>울퉁불퉁's는 모양이나 중량, 과잉 생산 등의 이유로<br>
							판로를 잃은 농산물들의 제 가치를 찾아 음식물<br>
							쓰레기 발생을 줄이고, 낭비 없는 생산을 꿈 꿉니다.</p>
						</div>
					</div>
					<div class="right">
						<img class="vege_intro" src="resources/img/main/vege_intro.png">
					</div>
				</div>
				
				<div class="content2">
					<div class="title">BEST ITEMS</div>
					
					<div class="list">
						<div class="box">
							<img class="pro_img" src="resources/img/main/corn.jpeg"><br>
							<p class="name">햇 초당옥수수</p>
							<p class="price">10,900원</p>
						</div>
						<div class="box">
							<img class="pro_img" src="resources/img/main/paprika.jpeg"><br>
							<p class="name">당일 수확 못난이 파프리카<br>3kg 혼합색상</p>
							<p class="price">13,900원</p>
						</div>
						<div class="box">
							<img class="pro_img" src="resources/img/main/tomatos.jpeg"><br>
							<p class="name">GAP 못난이 완숙토마토 5kg</p>
							<p class="price">10,900원</p>
						</div>
						<div class="box">
							<img class="pro_img" src="resources/img/main/carrot.jpeg"><br>
							<p class="name">못난이 주스용 당근 10kg</p>
							<p class="price">28,900원</p>
						</div>
					</div>
					
					<input type="button" value="상품 더 보기" class="go_shop"
								onclick="location.href='product_list.do'">	
					
				</div>
				
				
			</div>
			
			<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
		<jsp:include page="include/footer.jsp" />
		
	</div>

</body>
</html>
