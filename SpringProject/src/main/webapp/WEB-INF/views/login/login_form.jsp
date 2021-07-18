<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>로그인</title>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
					
				<form action="<%=request.getContextPath()%>/login_ok.do">
					
					<div class="login_field">
				
						<div class="title">로그인</div>
						<div class="body">
							<div class="label">아이디</div>
							<input type="text" name="mem_id" required="required">
							<div class="label">비밀번호</div>
							<input type="password" name="mem_pwd" required="required">
							
							<div class="find">
								<a href="<%=request.getContextPath()%>/find_id.do">아이디 찾기</a>
								<a href="<%=request.getContextPath()%>/find_pwd.do">비밀번호 찾기</a>
							</div>
							
							<div class="btn_wrap">
								<input type="submit" value="로그인 하기" class="btn_login">
							</div>
							
							<div class="btn_wrap">
								<input type="button" value="회원 가입하기" class="btn_join"
									onclick="location.href='join.do'">	
							</div>
							
						</div>
						
					</div>
				
				</form>
				
				<br>
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="social_login">
					<a href="/oauth2/authorization/naver">dd</a>
					<a href="naver.do"><img class="naver_login" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a><br>
				
					<a href="grant_delete.do?token=${token }">[네이버 연동 해제]</a><br>
					<a href="naver_index.do">[네이버 연동 추가]</a>
				</div>

			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>