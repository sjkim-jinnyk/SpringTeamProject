<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>