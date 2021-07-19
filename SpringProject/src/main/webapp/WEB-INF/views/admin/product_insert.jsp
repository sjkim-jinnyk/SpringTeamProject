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
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

function fileSizeCheck() {
	var fileSize = document.getElementById('upload').files[0].size;
	document.getElementById('uploadSize').innerHTML = String(fileSize).replace(/(.)(?=(\d{3})+$)/g,'$1,') + "Byte";
	console.log("fileSize", fileSize);
	
	if(document.getElementById('upload').value!=''){
		var fileSize = document.getElementById('upload').files[0].size;
		var maxSize = 1024 * 1024 * 10;
		
		if(fileSize > maxSize) {
			alert('첨부파일 사이즈는 10MB 이내로 등록 가능합니다.');
			return;
		}
	}
}

function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

</script>
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
								<img id="preview" src="">
								<input id="upload" type="file" name="pro_imgs"> <span id="uploadSize"></span> 최대 10MB 
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
							<input type="button" value="크기확인" onclick="fileSizeCheck();">
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