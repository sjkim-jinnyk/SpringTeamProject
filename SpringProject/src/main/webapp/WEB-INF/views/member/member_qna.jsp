<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>문의 내역</title>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					
					<div class="member_qna">
						<h3>문의 내역</h3>
						<table class="qna_bar">
							<c:set var="list" value="${qnaProductList }" />
							<c:set var="qclist" value="${qnaCategory }" />
							<tr>
								<th id="qnainfo">상품정보</th><th id="qnatitle">문의글</th>
								<th id="qnacate">문의유형</th><th id="qnadate">작성일</th>
							</tr>
								<c:forEach items="${qnaList }" var="dto" varStatus="status">
								<input type="hidden" id="listsize" value="${qnaList.size() }">
									<tr id="tablecont">
										<td>
											<a href="<%=request.getContextPath() %>/product_cont.do?no=${list[status.index].getPro_no()}">
												<ul>
													<li><img src="resources/img/upload/${list[status.index].getPro_img() }"></li>
													<li class="proname">${list[status.index].getPro_name() }</li>
												</ul>
											</a>
										</td>
										<td align="left"><a href="#none" id="qna_title${status.index}">${dto.getQna_title() }</a></td>
										<%-- <td><a id="qna_title" href="<%=request.getContextPath()%>/qna_cont.do?no=${dto.getQna_group()}">${dto.getQna_title() }</a></td> --%>
										<td>${qclist[status.index].getCate_name() }</td>
										<td>${dto.getQna_date().substring(0,10) }</td>
									</tr>
									<tr>
										<td> </td>
										<td colspan="3" id="qna_cont${status.index}" align="left" class="off" >${dto.getQna_cont() }</td>
									</tr>
									<c:if test="${reply[status.index].getQna_group() ==dto.getQna_group() }">
										<tr id="qna_reply${status.index}"class="off">
											<td>${reply[status.index].getQna_writer() }</td>
											<td align="left">${reply[status.index].getQna_cont() }</td>
											<td> </td>
											<td>${reply[status.index].getQna_date().substring(0,10) }</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:if test="${empty qnaList }">
									<tr>
										<td colspan="4" id="noHistory">문의하신 내역이 없습니다.</td>
									</tr>
								</c:if>
								
						</table>
					</div> <!-- member_qna END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_qna.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
</html>