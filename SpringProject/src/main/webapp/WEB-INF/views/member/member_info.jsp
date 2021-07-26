<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
</head>
<body>
	<div class="layout_container">
	<jsp:include page="../include/header.jsp" />
		<div class="main">
			<c:set var="mem" value="${Cont }" />
			<div class="member_container">
			<jsp:include page="../include/member_header.jsp"/>
				
				<!-- member_content -->
				<div class="member_content">
					<jsp:include page="../include/member_navmenu.jsp" />
					<div class="member_info">
						<h3 id="headName">기본 회원정보</h3>
						<ul>
							<li>
								<p id="tag">회원 아이디 *</p>
								<p id="mem_id">${mem.getMem_id() }</p>
							</li>
							<li>
								<p id="tag">회원 비밀번호 *</p>
								<!-- 현재 비밀번호 -->
								<div id="pwd_before" class="on">
									<p id="cont">
										<c:if test="${!empty mem.getMem_pwd() }">
											<c:forEach begin="1" end="${mem.getMem_pwd().length() }">
											*
											</c:forEach>
										</c:if>
									</p>
									<input type="button" value="비밀번호 변경" id="pwd_btn">
								</div>
								
								<!-- 변경 비밀번호 -->
								<div id="pwd_after" class="off">
									<form method="post" action="<%=request.getContextPath()%>/member_pwd_edit.do">
										<input type="hidden" name="db_pwd" value="${mem.getMem_pwd() }"> 
										<p>현재 비밀번호를 입력하세요</p>
										<input type="password" name="before_pwd" id="pwd_edit">
										<p>변경하실 비밀번호를 입력하세요</p>
										<p id="pwdinfo">비밀번호는 공백을 포함하지 않고, 영문/숫자를 사용하여 8자 이상으로 등록하세요</p>
										<input type="password" name="mem_pwd" id="pwd_edit">
										<br>
										<input type="button" value="취소" id="reset_btnPwd">
										<input type="submit" value="변경" id="submit_btnPwd">
									</form>
								</div>
							</li>
							<li>
								<p id="tag">회원 이름 *</p>
								<p id="mem_name">${mem.getMem_name() }</p>
							</li>
							<li>
								<p id="tag">자택 주소 *</p>
								
								<!-- 현재 주소 -->
								<div id="addr_before" class="on">
									<p id="cont">${mem.getMem_addr() }</p>
									<input type="button" value="주소 변경" id="addr_btn">
								</div> <!-- addr_before END -->
								
								<!-- 수정할 주소 -->
								<div id="addr_after" class="off"> 
									<form method="post" action="<%=request.getContextPath()%>/member_addr_edit.do">
										<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
										<input type="text" id="sample6_postcode" name="mem_zip" value="${mem.getMem_zip() }">
										<input type="button" id="addr_edit_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" name="mem_addr1" value="${mem.getMem_addr()}"><br>
										<input type="text" id="sample6_detailAddress" name="mem_addr2" placeholder="상세주소">
										<br>
										<input type="button" id="reset_btnA" value="취소">
										<input type="submit" id="submit_btnA" value="변경">
									</form>
								</div> <!-- addr_after END -->
							</li>
							<li>
								<p id="tag">연락처 * </p>
								<!-- 현재 연락처 -->
								<div id="phone_before" class="on">
									<p id="cont">${mem.getMem_phone() }</p>
									<input type="button" value="연락처 변경" id="phone_btn">
								</div> <!-- phone_before END -->
								
								<!-- 수정할 연락처 -->
								<div id="phone_after" class="off">
									<form method="post" action="<%=request.getContextPath()%>/member_phone_edit.do">
										<div id="phone_num">
										<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
										<input type="text" id="phone" name="phone1" size="4" maxlength="4" value="${mem.getMem_phone().substring(0,3) }">
											-
										<input type="text" id="phone" name="phone2" size="4" maxlength="4" value="${mem.getMem_phone().substring(4,8) }">
											-
										<input type="text" id="phone" name="phone3" size="4" maxlength="4" value="${mem.getMem_phone().substring(9,13) }">
										</div>
										<input type="button" id="reset_btnP" value="취소">
										<input type="submit" id="submit_btnP" value="변경">
									</form>
								</div> <!-- phone_before END -->
							</li>
						</ul>
					</div> <!-- member_info END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_addr.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- 주소 API 파일 로딩  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>