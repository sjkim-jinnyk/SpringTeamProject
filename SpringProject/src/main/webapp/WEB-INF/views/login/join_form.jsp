<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <link rel="stylesheet" href="resources/css/main.css"> -->
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
							<input type="text" id="mem_id" name="mem_id" required="required">
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
							<span class="label">휴대폰 번호</span>
							<input type="text" id="mem_phone" name="mem_phone" required="required">
							<span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span>
							<span id="phone_check_txt"></span>
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
						
						<input type="submit" id="submit" value="가입하기">
					</div>
					
				</form>
			
			</div>			
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
	<script type="text/javascript">
	
	// 아이디 중복 체크
	// 참고 : https://yejip.com/web/2020-12-15-%EA%B2%8C%EC%8B%9C%ED%8C%90ajax1/
	$(function(){
		$("#mem_id").on('keyup',fn_idCheck);
	})
	
	function fn_idCheck(){
	    var mem_id = $("#mem_id").val();
	    var sendData = {"mem_id":mem_id}
	    
	    $.ajax({
	        method : 'POST',
	        url : 'id_check',
	        data : sendData,
	        success : function(resp){
	            if(resp=='fail'){
	                $('#id_check_txt').css('color','red')
	                $('#id_check_txt').html("사용할 수 없는 아이디입니다.")
	                flag=false;
	  
	            }else{
	                $('#id_check_txt').css('color','blue')
	                $('#id_check_txt').html("사용가능한 아이디입니다.")
	                flag=true;
	            }}
	    })	
	}

	// 전화번호 중복 체크
	$(function(){
		$("#mem_phone").on('keyup',fn_phoneCheck);
	})
	
	function fn_phoneCheck(){
	    var mem_phone = $("#mem_phone").val();
	    var sendData = {"mem_phone":mem_phone}
	    
	    $.ajax({
	        method : 'POST',
	        url : 'phone_check',
	        data : sendData,
	        success : function(resp){
	            if(resp=='fail'){
	                $('#phone_check_txt').css('color','red')
	                $('#phone_check_txt').html("사용할 수 없는 전화번호입니다.")
	                flag=false;
	  
	            }else{
	                $('#phone_check_txt').css('color','blue')
	                $('#phone_check_txt').html("사용가능한 전화번호입니다.")
	                flag=true;
	            }}
	    })	
	}
	
	// 전화번호 형식 검사 000-0000-0000
	// 참고 : https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=irene-fts&logNo=221898756777
	function phoneCheck(){
		
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