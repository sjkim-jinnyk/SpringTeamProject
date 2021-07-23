<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/resources/js/login.js" defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <link rel="stylesheet" href="resources/css/main.css"> -->
<title>회원가입</title>
</head>
<body>

	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			
			<div class="join_wrap">
			
				<form name="joinForm" class="signup_field">
					
					<div class="field_header">
						<span class="title">회원가입</span>
					</div>
					
					<div class="field_cont">
						<div class="row">
							<span class="label">아이디 *</span>
							<input type="text" id="mem_id" name="mem_id" required="required"
								placeholder="4자리 이상 15자리 미만">
							<span id="id_check_txt"></span>
						</div>
						<div class="row">
							<span class="label">이름 *</span>
							<input type="text" name="mem_name" required="required">
						</div>
						<div class="row">
							<span class="label">비밀번호 *</span>
							<input type="password" name="mem_pwd" required="required">
						</div>
						<div class="row">
							<span class="label">휴대폰 번호 *</span>
							<input type="text" id="mem_phone" name="mem_phone" required="required" 
								placeholder="000-0000-0000">
							<!-- <span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span> -->
							<span id="phone_check_txt"></span>
						</div>
						<div class="row">
							<span class="label">우편번호 *</span>
							<input type="text" name="mem_zip" class="joinTxt" id="sample4_postcode">
							<input type="button" value="검색하기" required="required" onclick="sample4_execDaumPostcode()">
						</div>
						<div class="row">
							<span class="label">주소 *</span>
							<!-- <input type="text" name="mem_addr" required="required"> -->
							<input type="text" class="joinTxt" id="sample4_roadAddress" 
								name="mem_addr" size="40" required="required">
							<span id="guide" style="color:#999;display:none"></span>
						
						</div>
						
						<input type="submit" id="submit" value="가입하기" onclick="submitCheck()">
					</div>
					
				</form>
			
			</div>			
			
			
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
	<!-- 주소 API 파일 로딩  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</body>
</html>