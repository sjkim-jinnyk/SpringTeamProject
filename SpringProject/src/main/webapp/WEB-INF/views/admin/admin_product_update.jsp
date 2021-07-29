<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap-tagsinput.css">
<title>울퉁불퉁's 관리자 - 상품 수정</title>
</head>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
			
			<div class="amdin-title">상품 수정</div>
	
			<div class="admin-product-cont">
				<form method="post" action="product_update_ok.do" enctype="multipart/form-data">
					<input type="hidden" name="pro_no" value="${dto.getPro_no() }">
					<table class="admin-pro-cont">
					<c:if test="${!empty dto }">
						<tr>
							<th>상품번호</th>
							<td>${dto.getPro_no() }</td>
							<th>상태</th>
							<td>
								<select name="pro_check">
									<option value="y" <c:if test="${dto.getPro_check() eq 'y' }">selected</c:if> >판매</option>
									<option value="n" <c:if test="${dto.getPro_check() eq 'n' }">selected</c:if> >미판매</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="pro_category">
									<c:choose>
										<c:when test="${empty cdto }"><option value="">:::카테고리 없음:::</option></c:when>
										
										<c:otherwise>
											<c:forEach items="${cdto }" var="cdto">
												
													<option value="${cdto.getCate_no() }" <c:if test="${cdto.getCate_no() eq dto.getPro_category() }">selected</c:if> >${cdto.getCate_name() }[${cdto.getCate_no() }]</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
															
								</select>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="pro_name" value="${dto.getPro_name() }"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>대표<br>이미지</th>
							<td colspan="3">
								<div class="img-container">
								<img id="preview" src="resources/img/upload/${dto.getPro_img() }"><br>
								<input id="upload" type="file" name="pro_imgs" accept=".jpg, .jpeg, .png" onchange="readImg(this);"> 
								<p class="fileGuide"> * 첨부가능 파일종류 : jpg, png, jpeg (최대 10MB) </p>
							</div>
							</td>
						</tr>
						<tr>
							<th>입고가</th>
							<td colspan="3"><input type="text" name="pro_input_price" value="${dto.getPro_input_price() }"> 원 </td>
						</tr>
						<tr>
							<th>출고가</th>
							<td colspan="3"><input type="text" name="pro_output_price" value="${dto.getPro_output_price() }"> 원 </td>
						</tr>
						<tr>
							<th>태그</th>
							<td colspan="3">
								<input name="pro_tag" data-role="tagsinput" value="${dto.getPro_tag() }">
							</td>
						</tr>
						<tr>
							 <th>내용</th>
						</tr>
						<tr>
							<td colspan="4">
								<textarea id="ck_editor" rows="5" cols="80" name="pro_cont">${dto.getPro_cont() }</textarea>
								<script type="text/javascript">
									CKEDITOR.replace('ck_editor',{
									    filebrowserUploadUrl : "<%=request.getContextPath() %>/imageUpload.do"
									});
								</script>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<button class="default-btn" type="button" onclick="location.href='admin_product_cont.do?no=${dto.getPro_no()}'">취소</button>
								<div class="btn-wrap">
									<button class="pro-cont-btn update-btn" onclick="product_update.do?no=${dto.getPro_no() }">수정</button>
								</div>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${empty dto }">
						조회된 상품이 없습니다.
					</c:if>
					</table>
				</form>
			</div>
			
			<button onclick="location.href='#'" id="up-arrow" class="up-arrow"><img src="resources/img/main/up_arrow.png"></button>
			
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript" src="resources/js/bootstrap-tagsinput.js"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
</html>