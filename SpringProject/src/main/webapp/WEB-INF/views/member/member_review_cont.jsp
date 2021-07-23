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
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<c:set var="mem" value="${Cont }" />
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_reviewCont">
						<h3>구매후기 상세내역</h3>
						<table class="review_bar">
						<c:set var="rlist" value="${ReviewCont }" />
							<tr>
								<th>리뷰제목</th>
								<td>${rlist.getReview_title() }</td>
							</tr>
							<tr>
								<th>리뷰내용</th>
								<td>${rlist.getReview_cont() }</td>
							</tr>
							<tr>
								<th>사진</th>
								<td><img src="resources/img/upload/${rlist.getReview_img() }"></td>
							</tr>	
							<tr>
								<th>별점</th>
								<td>${rlist.getReview_star() }</td>
							</tr>		
							<tr>
								<th>작성일</th>
								<td>${rlist.getReview_date() }</td>
							</tr>																									
						</table>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>