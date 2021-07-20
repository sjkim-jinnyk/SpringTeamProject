<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
			
			<div class="id_field">
				<c:set var="id" value="${result_id }"/>
				<div class="title">아이디 찾기</div>
				<div class="body">
					회원가입시 사용한 아이디는 <span>${id }</span> 입니다.
				</div>
				<div class="btn_wrap">
					<input type="button" value="비밀번호 찾기"
						onclick="location.href='find_pwd.do'">	
					<input type="button" value="로그인하기"
						onclick="location.href='login.do'">	
					<input type="button" value="회원가입"
						onclick="location.href='join.do'">	
				</div>
			</div>
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
	
	
</body>
</html>