<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Member</title>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_delete">
						<h3 id="headName">회원탈퇴</h3>
						<ul class="deleteInfo">
							<p id="infoHead">탈퇴 유의사항</p>
							<li>무분별한 회원가입을 막기위해 회원탈퇴 후 6개월 동안 회원가입 하실 수 없습니다.</li>
							<li>한 번 탈퇴하면 복구할 수 없습니다.</li>
							<li>보유하고 있던 포인트, 쿠폰은 모두 소멸됩니다....등등</li>
						</ul>
						<form method="post" action="<%=request.getContextPath()%>/member_delete_ok.do">
							<input type="hidden" name="db_pwd" value="${mem.getMem_pwd() }">
							<div class="delete_pwd">
								<p>비밀번호를 입력하세요</p>
								<input type="password" name="mem_pwd"><br>
							</div>
							<input type="submit" value="삭제">
						</form>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>