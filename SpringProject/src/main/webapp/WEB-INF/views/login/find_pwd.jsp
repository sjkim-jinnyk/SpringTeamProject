<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/login.css?after">
<title>비밀번호 찾기</title>
</head>
<body>
	
	
	<div class="layout_container">
		
		<jsp:include page="../include/header.jsp" />
		
		<div class="main">
			
			<form name="find_id" method = "post" 
				action = "<%=request.getContextPath()%>/find_pwd_ok.do">
				
				<div class="login_wrap">
					
					<div class="title">비밀번호 찾기</div>
					<div class="body">
						<div class="label">아이디</div>
						<input type="text" id="mem_id" name="mem_id" required="required">
					</div>
					
					<div class="btn_wrap">
						<input type="submit" class="login_btn" id="submit" value="비밀번호 찾기">
					</div>
					
				</div>
			
			</form>
			
			
		</div>
		
		<jsp:include page="../include/footer.jsp" />
		
	</div>
	
	
</body>
</html>