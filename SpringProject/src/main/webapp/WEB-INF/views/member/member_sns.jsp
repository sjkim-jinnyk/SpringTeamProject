<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SNS 연동 설정</title>
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
				<c:set var="dto" value="${MemberSns }" />
					<jsp:include page="../include/member_navmenu.jsp" />
					<div class="member_sns">
						<h3 id="headName">SNS 연동 설정</h3>
						<c:if test="${dto.getMem_sns_id() eq null}">
							<ul class="snsBlock">
								<li>
									<label for="naver_checkOff" id="naverChkOff"><span>네이버 로그인 연결</span></label>
									<span id="snsCheck">
										<input type="button" name="naverChkOff" id="naver_checkOff" onclick="location.href='sns_connect.do?type=naver'">
									</span>
								</li>
								<li>
									<label for="kakao_checkOff" id="kakaoChkOff"><span>카카오 로그인 연결</span></label>
									<span id="snsCheck">
										<input type="button" name="kakaoChkOff" id="kakao_checkOff" onclick="location.href='sns_connect.do?type=kakao'">
									</span>
								</li>
							</ul>
						</c:if>
						<c:if test="${dto.getMem_sns_id() != null }">
							<ul class="snsBlock">
								<c:if test="${dto.getMem_sns_type() == 'naver' }">
								<li>
									<label for="naver_checkOn" id="naverChkOn"><span>네이버 로그인 해제</span></label>
									<span id="snsCheckOn">
										<input type="button" name="naverChkOn" id="naver_checkOn" onclick="location.href='grant_delete.do'">
									</span>
								</li>
								</c:if>
								<c:if test="${dto.getMem_sns_type()  == 'kakao' }">
								<li>
									<label for="kakao_checkOn" id="kakaoChkOn"><span>카카오 로그인 해제</span></label>
									<span id="snsCheckOn">
										<input type="button" name="kakaoChkOn" id="kakao_checkOn"  onclick="location.href='grant_delete.do'">
									</span>
								</li>
								</c:if>
							</ul>
						</c:if>

					</div> <!-- member_info END -->
				</div> <!-- member_content END-->
			</div> <!-- member_container END-->
		</div>  <!-- main END -->
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>