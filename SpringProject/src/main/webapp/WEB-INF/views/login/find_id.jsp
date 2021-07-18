<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/login.js" defer></script>
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
					<input type="submit" id="submit" value="찾기" 
							onclick="phoneCheck();">
				</div>
			
			</form>
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>