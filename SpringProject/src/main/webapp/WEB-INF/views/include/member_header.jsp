<%@page import="com.spring.model.MemberDAO"%>
<%@page import="com.spring.model.MemberDAOImpl"%>
<%@page import="com.spring.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String session_id = (String)session.getAttribute("session_id"); 

	//MemberDAOImpl 1dao = new MemberDAOImpl();
	//MemberDTO mdto = dao.getMemberInfo(session_id);	
	//int coupon = dao.couponCount(session_id);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
			<div class="member_container">
				<!-- header_title -->
				<div class="header_title">
					<a href="<%=request.getContextPath() %>/member_home.do?id=${session_id }"><h3>My Page</h3></a>
				</div> <!-- header_title END -->
				
				<!-- member_header -->
				<div class="member_header">
					<ul>
						<li><a href="<%=request.getContextPath()%>/member_info.do?id=${session_id }"><i class="fas fa-user-circle"></i></a></li>
						<li>
							<ul class="user_info">
								<li><a href="<%=request.getContextPath()%>/member_info.do?id=${session_id }">${session_id }님 </a>환영합니다.</li>
								<li><a href="<%=request.getContextPath()%>/member_info.do?id=${session_id }">${session_id }</a></li>
							</ul>
						</li>
					</ul>
					<ul class="my_menu">
						<a href="">
							<li>
								<ul class="menu_bar">
									<li>적립금 </li>
									<li></li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_coupon.do?id=${session_id }">
							<li>
								<ul class="menu_bar">
									<li>쿠폰 </li>
									<%-- <li><%=coupon%></li> --%>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_review.do?id=${session_id }">
							<li>
								<ul class="menu_bar">
									<li>리뷰 </li>
									<li></li>
								</ul>
							</li>
						</a>
						<a href="<%=request.getContextPath() %>/member_productLike.do?id=${session_id }">
							<li>
								<ul class="menu_bar">
									<li>찜 </li>
									<li></li>
								</ul>
							</li>
						</a>
					</ul>
				</div> <!-- member_header END -->
			</div>
</body>
</html>