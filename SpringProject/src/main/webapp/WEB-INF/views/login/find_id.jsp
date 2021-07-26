<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/login.js" defer></script>
<link rel="stylesheet" href="resources/css/login.css?after">
<title>아이디 찾기</title>
</head>
<body>
	
	
	<div class="layout_container">
		
		<jsp:include page="../include/header.jsp" />
		
		<div class="main">
			
			<form name="find_id">
				 
				<div class="login_wrap">
					
					<div class="title">아이디 찾기</div>
					<div class="body">
						<div class="label">전화번호</div>
						<input type="text" name="mem_phone" required="required">
						<span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span>
					</div>
					
					<div class="btn_wrap">
						<input class="login_btn" type="submit" id="submit" value="아이디 찾기" 
								onclick="phoneCheck();">
					</div>			
							
				</div>
			
			</form>
			
		</div>
		
		<jsp:include page="../include/footer.jsp" />
		
	</div>

</body>
</html>