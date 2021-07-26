<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/review.css?after">
<title>리뷰</title>
</head>
<body>
	
	<jsp:include page="../include/header.jsp" />

	<div class="layout_container">
		
		<div class="main">
			
			
			<c:set var="dto" value="${cont }" />
			
			<div class="r_cont">
				
				<p class="title">${dto.getReview_title() }</p>
				<span class="star"><c:forEach begin="1" end="${dto.getReview_star() }" >★</c:forEach></span>
				<p class="writer">${dto.getReview_writer() }</p>
				<p class="cont">${dto.getReview_cont() }</p>
				
				<c:if test="${!empty dto.getReview_img() }">
					<img alt="리뷰 사진" class="pro_img" src="resources/img/upload/${dto.getReview_img() }">
				</c:if>
				
				<div class="devide"></div>
				
				<a class="go_list" href="<%=request.getContextPath() %>/review_list.do"> ＜ 목록으로 가기 </a>
				
			</div>
			
			
		</div>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>