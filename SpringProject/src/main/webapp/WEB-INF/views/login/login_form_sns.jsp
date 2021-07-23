<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<title>로그인</title>
</head>
<body>

	<!-- sns 로그인 개발 중 : sns_login.do -->

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
					
				<c:choose>
				<c:when test="${sessionId != null}">
					<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
					<h3>'${sessionId}' 님 환영합니다! </h3>
					<h3><a href="logout.do">로그아웃</a></h3>
					<a href="grant_delete.do?token=${token }">[네이버 연동 해제]</a><br>
					${token }
				</c:when>
				<c:otherwise>

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
				<div id="naver_id_login"><a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
				<br>
				
								
			</c:otherwise>
	</c:choose>
				
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>