<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="layout_container">
		<jsp:include page="../include/admin_sidebar.jsp" />
		<div class="main">

			<div align="center">
				<hr width="50%" color="red">
				<h3>회원 목록</h3>
				<hr width="50%" color="red">
				<br> <br>

				<table border="1" cellspacing="0" width="500">
					<tr>
						<th>회원번호</th>
						<th>회원성명</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>가입일자</th>
						<th>적립금</th>
					</tr>

					<c:set var="list" value="${searchList }" />
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.getMem_no() }</td>
								<td>${dto.getMem_name() }</td>
								<td>${dto.getMem_phone() }</td>
								<td>${dto.getMem_addr() }</td>
								<td>${dto.getMem_regdate().substring(0,10) }</td>
								<td>${dto.getMem_point() }</td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty list }">
						<tr>
							<td colspan="4" align="center">
								<h3>검색된 게시물이 없습니다.....</h3>
							</td>
						</tr>
					</c:if>

					<tr>
						<td colspan="4" align="right">
							<input type="button"
								value="회원목록" onclick="location.href='admin_list.do'">
						</td>
					</tr>
				</table>
				<br> <br>

				<div class="pagination">
					<c:if test="${page.getPage() > page.getBlock() }">
						<a href="admin_list.do?page=1">◀◀</a>
						<a href="admin_list.do?page=${Paging.getStartBlock() - 1 }">◀</a>
					</c:if>

					<c:forEach begin="${page.getStartBlock() }"
						end="${page.getEndBlock() }" var="i">
						<c:if test="${i == page.getPage() }">
							<b><a href="product_list.do?page=${i }">${i }</a></b>
						</c:if>

						<c:if test="${i != page.getPage() }">
							<a href="admin_list.do?page=${i }">${i }</a>
						</c:if>
					</c:forEach>

					<c:if test="${page.getEndBlock() < page.getAllPage() }">
						<a href="admin_list.do?page=${page.getEndBlock() +1 }">▶</a>
						<a href="admin_list.do?page=${page.getAllPage() }">▶▶</a>
					</c:if>
					<br>
				</div>

			</div>
		</div>
		<jsp:include page="../include/footer.jsp" />
	</div>

</body>
</html>