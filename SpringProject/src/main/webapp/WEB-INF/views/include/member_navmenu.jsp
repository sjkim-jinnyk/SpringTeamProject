<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
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
</body>
</html>