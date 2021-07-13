<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			
				<form name="joinForm" class="signup_field">
					
					<div class="field_header">
						<span class="title">회원가입</span>
					</div>
					
					<div class="field_cont">
						<div class="row">
							
							<span class="label">아이디 *</span>
							<input type="text" name="mem_id" required="required">
							<input type="button" value="중복확인" onclick="location.href='id_dup_check.do'">
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
							<span class="label">휴대폰 번호</span>
							<input type="text" name="mem_phone" required="required">
							<span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span>
						</div>
						<div class="row">
							<span class="label">우편번호 *</span>
							<input type="text" name="mem_zip">
							<input type="button" value="검색하기" required="required">
						</div>
						<div class="row">
							<span class="label">주소</span>
							<input type="text" name="mem_addr" required="required">
						</div>
						
						<input type="submit" value="가입하기" onclick="submitCheck();">
					</div>
					
				</form>
			
			</div>			
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
	<script type="text/javascript">
			
	// 전화번호 형식 검사 000-0000-0000
	// 참고 : https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=irene-fts&logNo=221898756777
	function submitCheck(){
		
		var phoneReg = /(01[016789])-\d{3,4}-\d{4}/g;
		
		if(!phoneReg.test(joinForm.mem_phone.value)) {
			alert("전화번호를 형식에 맞게 입력해주세요.");
			joinForm.mem_phone.focus();
			return;
		}
		
		joinForm.method = "post";
		joinForm.action = "<%=request.getContextPath()%>/join_ok.do";
		joinForm.submit();
	}
	
	</script>

</body>
</html>