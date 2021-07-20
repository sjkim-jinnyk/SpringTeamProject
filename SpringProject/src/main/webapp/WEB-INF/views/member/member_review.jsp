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
			<jsp:include page="../include/member_header.jsp"/>
				
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
					
					<div class="member_order">
						<table class="order_bar" border="1">
						<c:set var="plist" value="${ProductInfo }"/>
						<c:set var="odlist" value="${OrderDetail }"/> 
						<c:set var="olist" value="${OrderInfo }"/> 
						<c:set var="rlist" value="${ReviewList }"/>
						
							<tr>
								<th>상품정보</th><th>구매일</th><th>후기 작성</th>
							</tr>
							
							
								<c:forEach items="${olist }" var="olist" varStatus="status">
									<tr>
										<c:if test="${odlist[status.index].getOrder_pro_no() == plist[status.index].getPro_no()}">
											<td>${plist[status.index].getPro_name() }</td>
										</c:if>
										
										<c:if test="${odlist[status.index].getOrder_pro_no() != plist[status.index].getPro_no()}">
											<td>XXX</td>
										</c:if>
										<c:if test="${olist.getOrder_no() == rlist[status.index].getOrder_no()}">
											<td>${olist.getOrder_date() }</td>
										</c:if>
										<c:if test="${olist.getOrder_no() != rlist[status.index].getOrder_no()}">
											<td>X</td>
										</c:if>
										<c:if test="${rlist[status.index].getReview_title() != null}">
											<td><a href="<%=request.getContextPath()%>/member_review_cont.do?no=${rlist[status.index].getOrder_no() }">${rlist[status.index].getReview_title() }</a></td>
										</c:if>
										<c:if test="${rlist[status.index].getReview_title() == null}">
											<td><input type="button" value="후기작성" onclick="location.href='member_review_write.do?no=${rlist[status.index].getOrder_no()}'"></td>
										</c:if>
									</tr>
								</c:forEach>
							
						</table>
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</html>