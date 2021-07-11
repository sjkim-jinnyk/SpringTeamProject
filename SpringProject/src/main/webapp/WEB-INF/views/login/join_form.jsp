<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/main.css">
<title>회원가입</title>
</head>
<body>

	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
			<div class="join_wrap">
			
				<form method="post" class="signup_field"
					action="<%=request.getContextPath()%>/join_ok.do">
					
					<div class="field_header">
						<span class="title">회원가입</span>
					</div>
					
					<div class="field_cont">
						<div class="row">
							<span class="label">아이디 *</span>
							<input type="text" name="mem_id">
							<input type="button" value="중복확인">
						</div>
						<div class="row">
							<span class="label">이름 *</span>
							<input type="text" name="mem_name">
						</div>
						<div class="row">
							<span class="label">비밀번호 *</span>
							<input type="password" name="mem_pwd">
						</div>
						<div class="row">
							<span class="label">휴대폰 번호</span>
							<input type="text" name="mem_phone">
						</div>
						<div class="row">
							<span class="label">우편번호 *</span>
							<input type="text" name="mem_zip">
							<input type="button" value="검색하기">
						</div>
						<div class="row">
							<span class="label">주소</span>
							<input type="text" name="mem_addr">
						</div>
						
						<input type="submit" value="가입하기">
					</div>
					
				</form>
			
			</div>			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
</body>
</html>