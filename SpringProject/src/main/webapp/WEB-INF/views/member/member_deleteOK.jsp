<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<div class="memberInfoDel">
				<p>회원 탈퇴 되었습니다.</p>
				<p>그동안 이용해주셔서 감사합니다.</p>
				<input type="button" value="메인페이지" class="goMain_btn" onclick="location.href='main.do'">
			</div>
		</div>  <!-- main END -->
		<jsp:include page="../include/footer.jsp" />
	</div>  <!-- layout_containe END -->
</body>
</html>