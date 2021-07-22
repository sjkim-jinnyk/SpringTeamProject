<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstarp.main.css">
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/memberStyle.css">
<link rel="stylesheet" href="resources/css/product.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>울퉁불퉁's 관리자 - 상품 등록</title>
</head>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
<body>
	
		<div class="wrapper d-flex align-items-stretch">
		<jsp:include page="../include/admin_sidebar.jsp" /> 

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		
			<form method="post" action="product_insert_ok.do" enctype="multipart/form-data">
				<table>
					<tr>
						<th>제품명</th>
						<td><input name="pro_name" required></td>
					</tr>				
					<tr>
						<th>카테고리</th>
						<td>
							<select name="pro_category">
								<c:if test="${empty list }">
									<option value="">::카테고리 없음::</option>
								</c:if>
								
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto">
										<option value="${dto.getCate_no() }">${dto.getCate_name() }[${dto.getCate_no() }]</option>
									</c:forEach>
								</c:if>
							</select>
							
						</td>
					</tr>
					<tr>
						<th>입고가</th>
						<td><input name="pro_input_price" required></td>
					</tr>
					<tr>
						<th>출고가</th>
						<td><input name="pro_output_price" required></td>
					</tr>
					<tr>
						<th>태그</th>
						<td><input name="pro_tag" required></td>
					</tr>
					<tr>
						<th>판매여부</th>
						<td><select name="pro_check">
								<option value="y">판매</option>
								<option value="n">미판매</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th>상품 대표 이미지</th>
						<td>
							<div class="ima-container">
								<img id="preview" src=""><br>
								<input id="upload" type="file" name="pro_imgs" onchange="readImg(this);"> 최대 10MB 
							</div>
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<textarea id="ck_editor" rows="5" cols="80" name="pro_cont"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('ck_editor',{
								    filebrowserUploadUrl : "<%=request.getContextPath() %>/imageUpload.do"
								});
							</script>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="button" value="취소" onclick="location.href='admin_product_list.do'">
							<input type="submit" value="등록">
							<input type="reset" value="초기화">
						</td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
</body>
</html>