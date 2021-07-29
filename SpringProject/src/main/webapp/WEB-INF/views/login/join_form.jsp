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
<link rel="stylesheet" href="resources/css/login.css?after">
<title>회원가입</title>
</head>
<body>

	<div class="layout_container">
		
		<jsp:include page="../include/header.jsp" />
		
		<div class="main">
			
			<div class="login_wrap">
			
				<form name="joinForm" class="signup_field">
					<input type="hidden" name="mem_sns_id" value="${sns_id }">
					<input type="hidden" name="mem_sns_type" value="${sns_type }">
					
					<div class="title">
						<c:if test="${!empty sns_type }"><img width="28px" style="vertical-align: middle;" src="resources/img/main/${sns_type }.png"> SNS로 </c:if> 회원가입
					</div>
				
					<div class="row">
						<div class="label">아이디 *</div>
						<input type="text" id="mem_id" name="mem_id" required="required"
							placeholder="4자리 이상 15자리 미만">
						<span id="id_check_txt"></span>
					</div>
					<div class="row">
						<div class="label">이름 *</div>
						<input type="text" name="mem_name" value="${sns_name }" required="required">
					</div>
					<div class="row">
						<div class="label">비밀번호 *</div>
						<input type="password" name="mem_pwd" required="required">
					</div>
					<div class="row">
						<div class="label">휴대폰 번호 *</div>
						<input type="text" id="mem_phone" name="mem_phone" value="${sns_phone }" required="required" 
							placeholder="000-0000-0000">
						<!-- <span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span> -->
						<div id="phone_check_txt"></div>
					</div>
					<div class="row">
						<div class="label">우편번호 *</div>
						<div class="zip">
							<input type="text" name="mem_zip" class="joinTxt" id="sample4_postcode">
							<input type="button" class="zip_btn" value="검색하기" required="required" onclick="sample4_execDaumPostcode()">
						</div>
					</div>
					<div class="row">
						<div class="label">주소 *</div>
						<!-- <input type="text" name="mem_addr" required="required"> -->
						<input type="text" class="joinTxt" id="sample4_roadAddress"
							name="mem_addr" size="40" required="required">
						<span id="guide" style="color:#999;display:none"></span>
					
					</div>
						
					<div class="btn_wrap">
						<c:if test="${empty sns_type }"><input type="submit" class="login_btn" id="submit" value="가입하기" onclick="submitCheck()"></c:if>
						<c:if test="${!empty sns_type }"><input type="submit" class="login_btn" id="submit" value="가입하기" onclick="submitCheckSNS()"></c:if>
					</div>	
					
				</form>
			
			</div>			
			
		</div>
		
		<jsp:include page="../include/footer.jsp" />
		
	</div>
	
</body>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- 주소 API 파일 로딩  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</html>