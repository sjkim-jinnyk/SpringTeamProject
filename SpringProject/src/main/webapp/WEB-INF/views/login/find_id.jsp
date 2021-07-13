<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
			<form name="find_id">
				
				<div class="id_field">
					
					<div class="title">아이디 찾기</div>
					<div class="body">
						<div class="label">전화번호</div>
						<input type="text" name="mem_phone" required="required">
						<span class="guide">* 000-0000-0000 형식으로 작성해주세요.</span>
					</div>
					<input type="submit" value="찾기">
				</div>
			
			</form>
			
			
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
		joinForm.action = "<%=request.getContextPath()%>/find_id_ok.do";
		joinForm.submit();
	}
	
	</script>
	
</body>
</html>