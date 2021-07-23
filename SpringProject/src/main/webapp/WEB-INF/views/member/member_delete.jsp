<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	HttpSession session1 = request.getSession();
	String session_id = (String)session.getAttribute("session_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberStyle.css">


<title>Member</title>
</head>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<div class="nav_menu">
						<ul>
							<a href="<%=request.getContextPath() %>/member_home.do"><li>주문내역</li></a>
							<a href="<%=request.getContextPath() %>/member_qna.do"><li>문의내역</li></a>
							<a href="<%=request.getContextPath() %>/member_recent.do"><li>최근 본 상품</li></a>
							<li>
								<a href="#none" id="info_click">정보관리</a>
								<ul id="info_display" class="on">
									<a href="<%=request.getContextPath() %>/member_info.do"><li>회원정보 수정</li></a>
									<a href="<%=request.getContextPath() %>/member_info_delete.do"><li>회원 탈퇴</li></a>
								</ul>
							</li>
						</ul>
					</div> <!-- nav_menu END -->
					
					<div class="member_order">
						<h3>회원탈퇴 주의사항</h3>
						<ul class="deleteInfo">
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
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>