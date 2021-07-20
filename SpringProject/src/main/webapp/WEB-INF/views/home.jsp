<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<title>UTBT</title>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="include/header.jsp"/>
			
			<div id="section1"> <!-- 슬라이드 -->
				<div class="slide_bg">[슬라이드 배경 이미지]</div>
				<div class="slide_title">1년을 기다린 맛!<br>햇출하, 초당옥수수</div>
				<div class="slide_caption">과일보다 높은 당도의 달콤한 맛<br>전자렌지 돌려먹는 간편한 옥수수 예약 중</div>
				<input type="button" class="silde_btn" value="예약하기"
					onclick="location.href='#.do'">
				<div class="slide_page">[슬라이드 페이지 표시]</div>
			</div>
			
			<div class="spacing"></div>
			
			<div id="section2"> <!-- 슬라이드 -->
				<div class="gallery_img">[토마토 그림]</div>
				<div class="gallery_caption">개성있는 외모는 덤</div>
			</div>
			
			<div class="spacing"></div>
			
			<div id="section3">
				<div class="title"><p>어글리 친환경 채소 박스</p></div>
			 	<div class="devide">-</div>
			 	<div class="caption">
			 		<p>국, 찌개, 반찬용으로 집에 항상 구비하고 있어야 하는 
					 	필수 채소인 대파, 호박, 오이, 양파, 감자 등등.. 삐뚤빼뚤 못생기고 상처와 흠도 있지만 
					 	유기농, 무농약의 건강한 채소로 모아서 저렴하게 보내드려요.</p>
				</div>
				<input type="button" class="buy_btn" value="구매하기"
					onclick="location.href='#.do'">
				<div class="img">[채소 박스 이미지]</div>
			</div>
			
			<div class="spacing"></div>
			
			<div id="section4">
				
				<div class="title">
					<p>UGLY SAVE THE MONEY</p>
					<div class="devide">-</div>
				</div>
				
				<div class="product"> <!-- c:foreach 반복 -->
					<div class="thumb">[상품 사진]</div>
					<div class="name">못난이 완숙토마토 3kg</div>
					<div class="price"><span class="price_span">[상품가격]</span></span></div>
				</div>
				
				<div class="paging">[페이지 번호]</div>
				
			</div>
			
			<div id="section5">
				<div class="img">[농산물 이미지]</div>
				<div class="title"><p>이 달의 농산물 '초당옥수수'</p></div>
			 	<div class="devide">-</div>
			 	<div class="caption">
			 		<p>5월말에서 7월까지만 맛볼 수 있는 인기템 초당옥수수! 수분이 많고 당도가 
			 		높아서 생으로 먹을 수도 있고 전자렌지에 돌려서 간편하게 바로 먹을 수 있어요</p>
				</div>
				<input type="button" class="buy_btn" value="구매하기"
					onclick="location.href='#.do'">
			</div>
			
			<div class="spacing"></div>
			
			<div id="section6">  <!-- 양쪽 스위치 있는 갤러리 -->
				<div class="title">
					<p>UGLY SAVE THE PLANET</p>
					<div class="devide">-</div>
				</div>
				<div class="gallery">
					<div class="img">[갤러리 배경이미지]</div>
					<div class="body">
						<div class="gallery_title">75,750,000g</div>
						<div class="gallery_caption">양파값 폭락으로 밭을 갈아 엎어버리는 농민분들을 
							위해 19년 07월 안성미양농협과 함께 약 2주간 18톤에 가까운 양파를 폐기될 
							운명에서 맛있는 식재료로 소비자들과 만날 수 있도록 도왔어요</div>
					</div>
				</div>
				
			</div>
			
			<div class="spacing"></div>
			
			<div id="section7"> <!-- 슬라이드 -->
				<div class="title">
					<p>REVIEWS</p>
					<div class="devide">-</div>
				</div>
				<div class="side_wrap">
					<div class="bg">
						<div class="review_cont">못난이 감자라고 해서 별로 기대하지 않았는데, 매우 만족합니다.</div>
						<div class="review_writer">네이버 구매평</div>
					</div>
				</div>
			</div>
			
			<jsp:include page="include/footer.jsp" />
		</div>
	</div>

</body>
</html>
