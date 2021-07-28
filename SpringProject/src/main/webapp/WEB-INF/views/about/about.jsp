<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css?after">
<title>ABOUT</title>
</head>
<body>

	
	<div class="layout_container">
		
		<jsp:include page="../include/header.jsp"/>
		
		<div class="about_header">
			<span>ABOUT US</span>
			<img src="resources/img/main/orange_bg.jpeg">
		</div>
		
		<div class="main">
		
			<div class="intro">
				<img src="resources/img/main/vege_box.jpeg">
				
				<div class="text">
					<p class="title">우리는 울퉁불퉁's 입니다</p>
					<p class="cont">같은 땅에서 똑같이 건강하게 자랐지만
						농산물들의 모양과 크기, 과잉 생산의 이유로 
						매해 전체 생산량의 1/3이 폐기되고 있습니다.  
						특이한 생김새로 인해 버려질 위기에 처한 
						속만큼은 고품질인 채소 과일들을 저렴하게 구독해보세요.
						친환경 농산물의 제 가치를 찾아
						음식물 폐기와 낭비를 막고 건강한 땅이 지속가능하게 합니다.</p>
				</div>
			</div>
			
			<div class="points">
				<div class="box">
					<p class="title">친환경/유기농산물이 최대 30% 저렴해요</p>
					<p class="cont">농약 없이 안전하게 자란 친환경/유기농산물로 이제 부담없이 식탁을 채우세요.</p>
				</div>
				<div class="box">
					<p class="title">유통 과정을 줄여 매우 신선해요</p>
					<p class="cont">불필요한 유통과정 없이 가장 신선하게 보내드립니다. 산지에서 갓 수확한 채소를 즐기세요.</p>
				</div>
				<div class="box">
					<p class="title">불필요한 낭비를 막아 환경에 이로워요</p>
					<p class="cont">음식물 폐기와 낭비를 줄입니다. 친환경 농가의 추가 소득을 일으켜 살아있는 우리 땅이 더 지속가능하게 합니다.</p>
				</div>
			</div>
				
		</div>
		
		<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
			
		<jsp:include page="../include/footer.jsp" />
		
	</div>

</body>
</html>

