<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
</head>
<body onLoad="window.resizeTo(300, 500); window.moveTo(400,200);">

	<div class="layout_container">
		<div class="main">
					
				<form action="<%=request.getContextPath()%>/login_popup_ok.do">
					
					<div class="login_field">
				
						<div class="title">로그인</div>
						<div class="body">
							<div class="label">아이디</div>
							<input type="text" name="mem_id" required="required">
							<div class="label">비밀번호</div>
							<input type="password" name="mem_pwd" required="required">
							
							<div class="find">
								<a href="javascript:void(0); opener.document.location.href='find_id.do'; window.close();">아이디 찾기</a>
								<a href="javascript:void(0); opener.document.location.href='find_pwd.do'; window.close();">비밀번호 찾기</a>
							</div>
							
							<div class="btn_wrap">
								<input type="submit" value="로그인 하기" class="btn_login">
							</div>
							
							<div class="btn_wrap">
								<input type="button" value="회원 가입하기" class="btn_join"
									onclick="opener.document.location.href='join.do'; window.close();">	
							</div>
							
						</div>
						
					</div>
				
				</form>
				
				<br>
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="social_login">
					<a href="naver.do"><img class="naver_login" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a><br>
				</div>

		</div>
	</div>
	
</body>
</html>