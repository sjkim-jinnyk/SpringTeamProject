<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			
			<div class="review_header">
				<span>실구매자 분들의 솔직한 구매후기</span>
				<hr>
			</div>
			
			<c:if test="${!empty List }">
				<c:forEach items="${List }" var="dto">
					<div class="review">
						<a href="<%=request.getContextPath() %>/review_cont.do?no="></a>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty List }">
				등록된 리뷰가 없습니다.
			</c:if>
			
			
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
</html>