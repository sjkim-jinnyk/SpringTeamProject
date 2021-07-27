$(document).ready(function() { 
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('.up-arrow').fadeIn(); 
			} else { $('.up-arrow').fadeOut(); 
			} 
		} 
	); 
});


// admin_category_list

function makeCate(index){
	if(document.getElementById('cate-'+index).style.display == 'block'){
		document.getElementById('cate-'+index).style.display = 'none';
		document.getElementById('cate-update-'+index).style.display = 'inline-block';
		document.getElementById('btn-'+index).style.display = 'none';
		document.getElementById('btn-update-'+index).style.display = 'block';
	}else {
		document.getElementById('cate-'+index).style.display = 'block';
		document.getElementById('cate-update-'+index).style.display = 'none';
		document.getElementById('btn-'+index).style.display = 'block';
		document.getElementById('btn-update-'+index).style.display = 'none';
	}
}

function deleteCate(no, name){
	if(confirm("'"+name+"' 카테고리를 삭제하시겠습니까?")){
		location.href='category_delete.do?no='+no;
	}
};

function updateCate(index) {
	
	var no = document.getElementById('cate-no-'+index).innerText;
	var name = document.getElementById('cate-name-'+index).value;
	
	$.ajax({
		type : "post",
		url : "category_update.do",
		data : {"cate_no":no, "cate_name":name},
		success : function(data) {
			if(data == 1){
				return false;
			}else {
				document.getElementById('cate-'+index).style.display = 'block';
				document.getElementById('cate-update-'+index).style.display = 'none';
				document.getElementById('btn-'+index).style.display = 'block';
				document.getElementById('btn-update-'+index).style.display = 'none';
				
				document.getElementById('cate-'+index).innerText = name;
			}
		},
		error: function(request,status,error) {
			alert("통신 오류입니다.");
		}
	}); 
}


// admin_product_cont

function deletePro(no, name){
	if(confirm("'"+name+"' 상품을 삭제하시겠습니까?")){
		location.href='product_delete.do?no='+no;
	}
};



// admin_product_insert, admin_product_update

function readImg(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
	if(input.files && input.files[0].size > (10485760)) {
        alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
        input.value = null;
    }
}



// admin_product_list, admin_product_search

function check() {
	var value = document.getElementById('field');
	value = value.options[value.selectedIndex].value;
	
	if(value == 'category'){
		document.getElementById('category').style.display = 'inline-block';
		document.getElementById('state').style.display = 'none';
		document.getElementById('search').style.display = 'none';
	}else if(value == 'state'){
		document.getElementById('category').style.display = 'none';
		document.getElementById('state').style.display = 'inline-block';
		document.getElementById('search').style.display = 'none';
	}else if(value == 'name' || value == 'tag'){
		document.getElementById('category').style.display = 'none';
		document.getElementById('state').style.display = 'none';
		document.getElementById('search').style.display = 'inline-block';
	}
	
}



