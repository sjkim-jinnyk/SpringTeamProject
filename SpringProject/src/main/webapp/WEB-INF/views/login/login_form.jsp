<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/login.css?after">
<title>로그인</title>
</head>
<body>
	
	
	<div class="layout_container">
		
		<jsp:include page="../include/header.jsp" />
		
		<div class="main">
		
			<div class="login_wrap">
				
				<form class="login_form" action="<%=request.getContextPath()%>/login_ok.do">
				
					<div class="title">로그인</div>
					<div class="body">
					
						<div class="row">
							<div class="label">아이디</div>
							<input type="text" name="mem_id" required="required">
						</div>
							
						<div class="row">
							<div class="label">비밀번호</div>
							<input type="password" name="mem_pwd" required="required">
						</div>
						
						<div class="btn_wrap">
							<div class="find">
								<a href="<%=request.getContextPath()%>/find_id.do" class="id">아이디 찾기</a>
								<a href="<%=request.getContextPath()%>/find_pwd.do" class="pwd">비밀번호 찾기</a>
							</div>
							
							<div class="normal_login">
								<input type="submit" value="로그인 하기" class="login_btn">
								<input type="button" value="회원 가입하기" class="login_btn"
								onclick="location.href='join.do'">	
							</div>
							
							<!-- 네이버 로그인 창으로 이동 -->
							<div id="social_login">
								<a href="sns_login.do?type=naver"><img class="naver_login" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a><br>
								<a href="sns_login.do?type=kakao"><img class="kakao_login" height="50" src="resources/img/main/kakao_login.png"/></a><br>
							
								<a href="grant_delete.do">[네이버 연동 해제]</a><br>
								<a href="grant_delete.do">[카카오 연동 해제]</a><br>
								<a href="sns_connect.do?type=naver">[네이버 연동 추가]</a><br>
								<a href="sns_connect.do?type=kakao">[카카오 연동 추가]</a>
							</div>
						</div>
						
					</div>
					
				</form>
				
			</div>
			
		</div>
		
		<jsp:include page="../include/footer.jsp" />
		
	</div>
	
	
</body>
</html>