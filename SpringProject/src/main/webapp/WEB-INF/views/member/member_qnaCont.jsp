<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MemberQnA</title>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_order">
						<h3>문의내용</h3>
						<table class="order_bar" border="1">
							<tr>
								<th>문의글</th>
								<td>${QnaCont.getQna_title() }</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td>${QnaCont.getQna_cont() }</td>
							</tr>
							<tr>
								<th>문의 날짜</th>
								<td>${QnaCont.getQna_date() }</td>
							</tr>
						</table>
						<br><br><br>
						<c:forEach items="${QnaReply }" var="dto">
							<table class="order_bar" border="1">
								<tr>
									<th>답변자</th>
									<td>${dto.getQna_writer() }</td>
								</tr>
								<tr>
									<th>답변글</th>
									<td>${dto.getQna_title() }</td>
								</tr>
								<tr>
									<th>답변내용</th>
									<td>${dto.getQna_cont() }</td>
								</tr>
								<tr>
									<th>답변 날짜</th>
									<td>${dto.getQna_date() }</td>
								</tr>
							</table>
						</c:forEach>
						
					</div> <!-- member_order END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>