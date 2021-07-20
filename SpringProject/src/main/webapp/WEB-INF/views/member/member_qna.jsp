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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Member</title>
</head>
<body>
	<div class="layout_container">
		<div class="main">
			<jsp:include page="../include/header.jsp" />
			 
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
						<table class="order_bar" border="1">
						<c:set var="list" value="${qnaProductList }" />
						<c:set var="qclist" value="${qnaCategory }" />
							<tr>
								<th>상품정보</th><th>문의글</th><th>문의유형</th><th>작성일</th>
							</tr>
								<c:forEach items="${qnaList }" var="dto" varStatus="status">
									<tr>
										<td>
											<ul>
												<a href="<%=request.getContextPath() %>/product_cont.do?no=${list[status.index].getPro_no()}">
												<li class="qnaimg"><img src="resources/img/product/${list[status.index].getPro_img() }"></li>
												<li>${list[status.index].getPro_name() }</li></a>
											</ul>
										</td>
										<td><a href="<%=request.getContextPath()%>/qna_cont.do?no=${dto.getQna_group()}">${dto.getQna_title() }</a></td>
										<td>${qclist[status.index].getCate_name() }</td>
										<td>${dto.getQna_date().substring(0,10) }</td>
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