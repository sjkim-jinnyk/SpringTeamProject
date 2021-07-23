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
							<p id="infoTitle">포인트 소멸</p>
							<li>- 회원탈퇴 시 보유하고 계신 포인트와 쿠폰이 자동 소멸되며 복원되지 않습니다.</li>
							<p id="infoTitle">회원 재가입 제한</p>
							<li>- 회원탈퇴 후 재가입 시 신규회원으로 가입되며, 탈퇴 전의 회원정보, 주문정보, 포인트, 쿠폰은 복원되지 않습니다.</li>
							<li>- 사이트 정책에 따라 최대 30일 동안 회원 재가입이 불가능합니다.</li>
							<li>- 한 번 탈퇴하면 복구가 불가능합니다.</li>
							<p id="infoTitle">개인정보 파기</p>
							<li>- 개인정보는 회원 재가입 유예기간 경과 후 즉시 파기됩니다.</li>
							<li>- 단, 전자상거래법, 통신비밀보호법 등 관련 법령의 규정에 의하여 일부 개인정보가 일정기간 보관됩니다.</li>
						</ul>
						<form method="post" action="<%=request.getContextPath()%>/member_delete_ok.do">
							<input type="hidden" name="db_pwd" value="${mem.getMem_pwd() }">
							<div class="deleteBox">
								<div class="delete_pwd">
									<p>비밀번호</p>
									<input id="pwdBox" type="password" name="mem_pwd"><br>
								</div>
								<div class="agreeCheck">
									<input type="hidden" id="noagreeC" name="agreeC" value="0">
									<input type="checkbox" id="agreeC" name="agreeC" value="1">
									<label for="agreeC">회원탈퇴 유의사항을 모두 확인하였으며, 울퉁불퉁's 회원탈퇴에 동의합니다.</label>
								</div>
							</div>
							<input id="deleteBtn" type="submit" value="삭제">
						</form>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
		<jsp:include page="../include/footer.jsp" />
	</div>  <!-- layout_containe END -->
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_delete.js"></script>
</html>