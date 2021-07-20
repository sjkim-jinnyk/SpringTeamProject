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
		<div class="main">
			<jsp:include page="../include/header.jsp" />
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
					
					<div class="member_info">
						
						<h3>회원정보 변경</h3>
						<ul>
							<li>
								<span>회원 아이디 *</span>
								<span name="mem_id">${mem.getMem_id() }</span>
							</li>
							<li>
								<span>회원 이름 *</span>
								<span name="mem_name">${mem.getMem_name() }</span>
							</li>
							<li>
								<p>자택 주소 *</p>
								
								<!-- 현재 주소 -->
								<div id="addr_before" class="on">
									<span>${mem.getMem_addr() }</span>
									<input type="button" value="주소 변경" id="addr_btn">
								</div> <!-- addr_before END -->
								
								<!-- 수정할 주소 -->
								<div id="addr_after" class="off"> 
									<form method="post" action="<%=request.getContextPath()%>/member_addr_edit.do">
										<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
										<input type="text" id="sample6_postcode" name="mem_zip" value="${mem.getMem_zip() }">
										<input type="button" id="addr_edit_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" name="mem_addr1" value="${mem.getMem_addr() }"><br>
										<input type="text" id="sample6_detailAddress" name="mem_addr2" placeholder="상세주소">
										<input type="submit" id="submit_btnA" value="변경">
									</form>
								</div> <!-- addr_after END -->
							</li>
							<li>
								<p>연락처 * </p>
								<!-- 현재 연락처 -->
								<div id="phone_before" class="on">
									<span>${mem.getMem_phone() }</span>
									<input type="button" value="연락처 변경" id="phone_btn">
								</div> <!-- phone_before END -->
								
								<!-- 수정할 연락처 -->
								<div id="phone_after" class="off">
									<form method="post" action="<%=request.getContextPath()%>/member_phone_edit.do">
										<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
										<input type="text" name="phone1" size="4" maxlength="4" value="${mem.getMem_phone().substring(0,3) }">
											-
										<input type="text" name="phone2" size="4" maxlength="4" value="${mem.getMem_phone().substring(4,8) }">
											-
										<input type="text" name="phone3" size="4" maxlength="4" value="${mem.getMem_phone().substring(9,13) }">
										<input type="submit" id="submit_btnP" value="변경">
									</form>
								</div> <!-- phone_before END -->
							</li>
						</ul>
					</div> <!-- member_info END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/addr.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- 주소 API 파일 로딩  -->

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>