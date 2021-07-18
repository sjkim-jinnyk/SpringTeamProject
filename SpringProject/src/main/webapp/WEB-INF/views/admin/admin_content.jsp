<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/product.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">

			<!-- 내용 시작 -->
			<div align="center">
				<hr width="50%" color="tomato">
				<h3>${dto.getMem_name() }님 상세 정보</h3>
				<hr width="50%" color="tomato">
				<br> <br>

				<table border="1" cellspacing="0" width="850">
					<c:set var="dto" value="${content }" />
					<c:if test="${!empty dto }">
						<tr>
							<th>회원이름</th>
							<td>${dto.getMem_name() }</td>
						</tr>
						<tr>
							<th>회원아이디</th>
							<td>${dto.getMem_id() }</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${dto.getMem_phone() }</td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td>${dto.getMem_addr() }</td>
						</tr>
						
						<tr>
							<th>적립금</th>
							<td>${dto.getMem_point() }</td>
						</tr>
						
						<tr>
							<td>${dto.getMem_regdate().substring(0,10) }</td>
						</tr>
					</c:if>

					<c:if test="${empty dto }">
						<tr>
							<td colspan="2" align="center">
								<h3>검색된 게시글이 없습니다.....</h3>
							</td>
						</tr>
					</c:if>

					<tr>
						<td colspan="2" align="center">
						<%-- <input type="button"
							value="글수정"
							onclick="location.href='board_update.do?no=${dto.getBoard_no() }&page=${page }'">
							
							<input type="button" value="글삭제"
							onclick="if(confirm('게시글을 삭제 하시겠습니까?')) {
	                				location.href='board_delete.do?no=${dto.getBoard_no() }&page=${page }'
	                		 }else {return; }"> --%>
							
							<input type="button" value="전체 회원 목록"
							onclick="location.href='admin_list.do?page=${page }'"></td>
					</tr>
				</table>
			</div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>

</body>
</html>