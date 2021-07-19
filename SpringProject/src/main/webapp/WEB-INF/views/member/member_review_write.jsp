<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberStyle.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
					<a href="<%=request.getContextPath() %>/member_home.do}"><h3>My Page</h3></a>
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
						<a href="<%=request.getContextPath() %>/member_review.do">
							<li>
								<ul class="menu_bar">
									<li>리뷰 </li>
									<li>${Review.getReviewCount() }</li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_productLike.do">
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
							<a href="<%=request.getContextPath() %>/member_home.do"><li>주문내역</li></a>
							<a href="<%=request.getContextPath() %>/member_qna.do"><li>문의내역</li></a>
							<a href="<%=request.getContextPath() %>/member_recent.do"><li>최근 본 상품</li></a>
							<a href="<%=request.getContextPath() %>/member_info.do"><li>정보관리</li></a>
						</ul>
					</div> <!-- nav_menu END -->
					
					<div class="member_review">
						<form method="post" name="review_form" enctype="multipart/form-data" action="<%=request.getContextPath() %>/member_review_wrtie_ok.do" >
							<c:set var="dto" value="${ReviewWrite }" />
							<input type="hidden" name="review_star" value="">
							<input type="hidden" name="order_no" value="${dto.getOrder_no() }">
							<h3 class="review_header">후기작성</h3>
							<ul class="review_info">
								<li>상품의 식별이 가능하도록 찍은 사진만 가능합니다.</li>
								<li>이메일, 휴대전화 번호 등의 개인 정보/광고/비속어가 포함된 후기는 블라인드 처리됩니다.</li>
								<li>내용은 최소 20자 이상 작성합니다.</li>
								<li>후기 등록 후 삭제는 불가합니다.</li>
							</ul>
							<div class="review_content">
								<div class="review_star">
									<span>별점</span>
									<a href="#none" id="star1" class="off"></a>
									<a href="#none" id="star2" class="off"></a>
									<a href="#none" id="star3" class="off"></a>
									<a href="#none" id="star4" class="off"></a>
									<a href="#none" id="star5" class="off"></a>
								</div>
								<div class="review_img">
									<span>사진</span>
									<input type="file" name="review_im">
								</div>
								<ul class="review_text">
									<li>
										<span>제목</span>
										<input type="text" name="review_title">
									</li>
									<li><textarea rows="7" cols="30" name="review_cont" placeholder="최소 20자 이상 입력해주세요"></textarea></li>
									<li>0 / 5,000</li>
								</ul>
							</div>
							<div>
								<input type="submit" value="등록">
							</div>
						</form>
					</div> <!-- member_review END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</html>