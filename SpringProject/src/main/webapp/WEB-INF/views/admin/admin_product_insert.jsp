<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap-tagsinput.css">
<title>울퉁불퉁's 관리자 - 상품 등록</title>
</head>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">

			<div class="main">

				<div class="amdin-title">상품 등록</div>

				<div class="row">
					<div class="col-md-12">
						<div class="admin-product-cont">
							<form method="post" action="product_insert_ok.do"
								enctype="multipart/form-data">
								<table class="admin-pro-cont">
									<tr>
										<th>제품명</th>
										<td><input type="text" name="pro_name" required></td>
									</tr>
									<tr>
										<th>카테고리</th>
										<td><select name="pro_category">
												<c:if test="${empty list }">
													<option value="">::카테고리 없음::</option>
												</c:if>

												<c:if test="${!empty list }">
													<c:forEach items="${list }" var="dto">
														<option value="${dto.getCate_no() }">${dto.getCate_name() }[${dto.getCate_no() }]</option>
													</c:forEach>
												</c:if>
										</select></td>
									</tr>
									<tr>
										<th>입고가</th>
										<td><input type="text" name="pro_input_price" required>
											원</td>
									</tr>
									<tr>
										<th>출고가</th>
										<td><input type="text" name="pro_output_price" required>
											원</td>
									</tr>
									<tr>
										<th>태그</th>
										<td><input name="pro_tag" data-role="tagsinput" required></td>
									</tr>
									<tr>
										<th>판매여부</th>
										<td><select name="pro_check">
												<option value="y">판매</option>
												<option value="n">미판매</option>
										</select></td>
									</tr>
									<tr>
										<th>상품 대표 이미지</th>
										<td>
											<div class="ima-container">
												<img id="preview" src=""><br> <input id="upload"
													type="file" name="pro_imgs" accept=".jpg, .jpeg, .png"
													onchange="readImg(this);">
												<p class="fileGuide">* 첨부가능 파일종류 : jpg, png, jpeg (최대
													10MB)</p>
											</div>
										</td>
									</tr>
									<tr>
										<th colspan="2">상품 설명</th>
									</tr>
									<tr>
										<td colspan="2"><textarea id="ck_editor" rows="5"
												cols="80" name="pro_cont"></textarea> <script
												type="text/javascript">
								CKEDITOR.replace('ck_editor',{
								    filebrowserUploadUrl : "<%=request.getContextPath()%>
													/imageUpload.do"
																	});
												</script></td>
									</tr>
									<tr>
										<td colspan="2">
											<button class="default-btn" type="button"
												onclick="location.href='admin_product_list.do'">취소</button>
											<div class="btn-wrap">
												<button class="pro-cont-btn update-btn" type="reset">초기화</button>
												<button class="pro-cont-btn delete-btn" type="submit">등록</button>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>

			</div>
			<button onclick="location.href='#'" id="up-arrow" class="up-arrow">
				<img src="resources/img/main/up_arrow.png">
			</button>
		</div>
	</div>
</body>
<script type="text/javascript" src="resources/js/bootstrap-tagsinput.js"></script>
</html>