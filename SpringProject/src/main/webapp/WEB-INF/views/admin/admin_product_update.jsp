<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/admin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>울퉁불퉁's 관리자 - 상품 수정</title>
</head>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<div class="main">	
	
			<div class="admin-product-cont">
				<form method="post" action="product_update_ok.do" enctype="multipart/form-data">
					<input type="hidden" name="pro_no" value="${dto.getPro_no() }">
					<table>
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
							<td><input name="pro_name" value="${dto.getPro_name() }"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>상품 대표이미지</th>
							<td>
								<div class="img-container">
								<img id="preview" src="resources/img/upload/${dto.getPro_img() }"><br>
								<input id="upload" type="file" name="pro_imgs" accept=".jpg, .jpeg, .png" onchange="readImg(this);"> 
								<p class="fileGuide"> * 첨부가능 파일종류 : jpg, png, jpeg (최대 10MB) </p>
							</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>입고가</th>
							<td><input name="pro_input_price" value="${dto.getPro_input_price() }"> 원 </td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>출고가</th>
							<td><input name="pro_output_price" value="${dto.getPro_output_price() }"> 원 </td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>태그</th>
							<td>
								<input type="text" name="pro_tag" value="${dto.getPro_tag() }">
							</td>
							
						</tr>
						<tr>
							<th>내 용</th>
							<td colspan="3">
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
								<button type="button" onclick="location.href='admin_product_cont.do?no=${dto.getPro_no()}'">취소</button>
								<button onclick="product_update.do?no=${dto.getPro_no() }">수정</button>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${empty dto }">
						조회된 상품이 없습니다.
					</c:if>
					</table>
				</form>
			</div>
			
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript" src="resources/js/admin.js"></script>
</html>