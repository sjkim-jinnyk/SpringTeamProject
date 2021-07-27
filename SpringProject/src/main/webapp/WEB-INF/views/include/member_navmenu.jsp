<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
	<div class="nav_menu">
		<ul id="nav_ul_x768">
			<a href="<%=request.getContextPath() %>/member_home.do" id="orderClick" class="n"><li>주문내역</li></a>
			<a href="<%=request.getContextPath() %>/member_qna.do" id="qnaClick" class="n"><li>문의내역</li></a>
			<a href="<%=request.getContextPath() %>/member_recent.do" id="recentClick" class="n"><li>최근 본 상품</li></a>
			<li>
				<a href="#none" id="info_click">회원정보 <i class="fas fa-chevron-down"></i></a>
			</li>
			<ul id="info_display" class="n off">
					<a href="<%=request.getContextPath() %>/member_info.do"><li>회원정보 수정</li></a>
					<a href="<%=request.getContextPath() %>/member_sns.do"><li>SNS 연동 설정</li></a>
					<a href="<%=request.getContextPath() %>/member_info_delete.do"><li>회원 탈퇴</li></a>
			</ul>
		</ul>
	</div> <!-- nav_menu END -->
	<div class="nav_menu_x768">
		<ul id="nav_ul_x768">
			<a href="<%=request.getContextPath() %>/member_home.do" id="orderClick" class="n"><li>주문내역</li></a>
			<a href="<%=request.getContextPath() %>/member_qna.do" id="qnaClick" class="n"><li>문의내역</li></a>
			<a href="<%=request.getContextPath() %>/member_recent.do" id="recentClick" class="n"><li>최근 본 상품</li></a>
			<a href="<%=request.getContextPath() %>/member_info.do"><li>회원정보 수정</li></a>
			<a href="<%=request.getContextPath() %>/member_sns.do"><li>SNS 연동 설정</li></a>
			<a href="<%=request.getContextPath() %>/member_info_delete.do"><li>회원 탈퇴</li></a>
		</ul>
	</div>
	<div class="nav_menu_x576">
		<ul id="nav_ul_x576">
			<a href="<%=request.getContextPath() %>/member_home.do" id="orderClick" class="n"><li>주문내역</li></a>
			<a href="<%=request.getContextPath() %>/member_qna.do" id="qnaClick" class="n"><li>문의내역</li></a>
			<a href="<%=request.getContextPath() %>/member_recent.do" id="recentClick" class="n"><li>최근 본 상품</li></a>
			<a href="<%=request.getContextPath() %>/member_info.do"><li>회원정보 수정</li></a>
			<a href="<%=request.getContextPath() %>/member_sns.do"><li>SNS 연동 설정</li></a>
			<a href="<%=request.getContextPath() %>/member_info_delete.do"><li>회원 탈퇴</li></a>
		</ul>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_navmenu.js"></script>
</html>