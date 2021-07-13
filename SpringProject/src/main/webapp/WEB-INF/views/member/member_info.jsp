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
				<!-- header_title -->
				<div class="header_title">
					<a href="<%=request.getContextPath() %>/member_home.do?id=${mem.getMem_id() }"><h3>My Page</h3></a>
				</div> <!-- header_title END -->
				
				<!-- member_header -->
				<div class="member_header">
					<ul>
						<li><i class="fas fa-user-circle"></i></li>
						<li>
							<ul class="user_info">
								<li>${mem.getMem_name() }님 환영합니다.</li>
								<li>${mem.getMem_id() }</li>
							</ul>
						</li>
					</ul>
					<ul class="my_menu">
						<a href="">
							<li>
								<ul class="menu_bar">
									<li>적립금 </li>
									<li>${mem.getMem_point() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_coupon.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>쿠폰 </li>
									<li>${Coupon.getCount() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_review.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>리뷰 </li>
									<li>${Review.getReviewCount() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_productLike.do?id=${mem.getMem_id() }">
							<li>
								<ul class="menu_bar">
									<li>찜 </li>
									<li>${Like.getLikeCount() }</li>
								</ul>
							</li>
						</a>
					</ul>
				</div> <!-- member_header END -->
				
				<!-- member_content -->
				<div class="member_content">
					<div class="nav_menu">
						<ul>
							<a href="<%=request.getContextPath() %>/member_orderList.do"><li>주문내역</li></a>
							<a href="<%=request.getContextPath() %>/member_qna.do"><li>문의내역</li></a>
							<a href="<%=request.getContextPath() %>/member_recent.do"><li>최근 본 상품</li></a>
							<li>
								<a href="#none" id="info_click">정보관리</a>
								<ul id="info_display" class="on">
									<a href="<%=request.getContextPath() %>/member_info_edit.do?id=${mem.getMem_id() }"><li>회원정보 수정</li></a>
									<a href="<%=request.getContextPath() %>/member_info_delete.do?id=${mem.getMem_id() }"><li>회원 탈퇴</li></a>
								</ul>
							</li>
						</ul>
					</div> <!-- nav_menu END -->
					
					<div class="member_order">
						
						<c:set var="dto" value="${memberInfo }" />
						
						<h3>회원정보 변경</h3>
						<ul>
							<li>
								<span>회원 아이디 *</span>
								<span name="mem_id">${dto.getMem_id() }</span>
							</li>
							<li>
								<span>회원 이름 *</span>
								<span name="mem_name">${dto.getMem_name() }</span>
							</li>
							<li>
								<p>자택 주소 *</p>
								
								<!-- 현재 주소 -->
								<div id="addr_before" class="on">
									<span>${dto.getMem_addr() }</span>
									<input type="button" value="주소 변경" id="addr_btn">
								</div> <!-- addr_before END -->
								
								<!-- 수정할 주소 -->
								<div id="addr_after" class="off"> 
									<form method="post" action="<%=request.getContextPath()%>/member_addr_edit.do">
										<input type="hidden" name="mem_id" value="${dto.getMem_id() }">
										<input type="text" id="sample6_postcode" name="mem_zip" value="${dto.getMem_zip() }">
										<input type="button" id="addr_edit_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" name="mem_addr1" value="${dto.getMem_addr() }"><br>
										<input type="text" id="sample6_detailAddress" name="mem_addr2" placeholder="상세주소">
										<input type="submit" id="submit_btnA" value="변경">
									</form>
								</div> <!-- addr_after END -->
							</li>
							<li>
								<p>연락처 * </p>
								<!-- 현재 연락처 -->
								<div id="phone_before" class="on">
									<span>${dto.getMem_phone() }</span>
									<input type="button" value="연락처 변경" id="phone_btn">
								</div> <!-- phone_before END -->
								
								<!-- 수정할 연락처 -->
								<div id="phone_after" class="off">
									<form method="post" action="<%=request.getContextPath()%>/member_phone_edit.do">
										<input type="hidden" name="mem_id" value="${dto.getMem_id() }">
										<input type="text" name="phone1" size="4" maxlength="4" value="${dto.getMem_phone().substring(0,3) }">
											-
										<input type="text" name="phone2" size="4" maxlength="4" value="${dto.getMem_phone().substring(4,8) }">
											-
										<input type="text" name="phone3" size="4" maxlength="4" value="${dto.getMem_phone().substring(9,13) }">
										<input type="submit" id="submit_btnP" value="변경">
									</form>
								</div> <!-- phone_before END -->
							</li>
						</ul>
					</div> <!-- member_order END -->
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