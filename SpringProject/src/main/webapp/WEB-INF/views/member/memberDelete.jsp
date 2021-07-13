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
						<h3>회원탈퇴 주의사항</h3>
						<ul class="deleteInfo">
							<li>무분별한 회원가입을 막기위해 회원탈퇴 후 6개월 동안 회원가입 하실 수 없습니다.</li>
							<li>한 번 탈퇴하면 복구할 수 없습니다.</li>
							<li>보유하고 있던 포인트, 쿠폰은 모두 소멸됩니다....등등</li>
						</ul>
						<form method="post" action="<%=request.getContextPath()%>/member_delete_ok.do">
							<input type="hidden" name="db_pwd" value="${memberInfo.getMem_pwd() }">
							<input type="hidden" name="delete_words" value="주의사항을 읽었습니다. 회원 탈퇴를 요청합니다.">
							<div class="delete_words">
								<h3>아래 문구를 동일하게 입력하세요</h3>
								<p>주의사항을 읽었습니다. 회원 탈퇴를 요청합니다.</p>
								<input type="text" name="delete_words_mem">
							</div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/addr.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- 주소 API 파일 로딩  -->

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>