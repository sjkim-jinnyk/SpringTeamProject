// product_cont

function show(index) {
	$('.qna-detail-'+index).toggle();
}

function showPhoto() { 
	$('#review-all').toggle();
	$('#review-photo').toggle();
};

function writeQna(product_no) {
	if('${session_id}' != ''){
		window.open("product_qna_write.do?no="+product_no, "질문글 작성하기", "_blank");
	}else {
		alert('로그인 후 작성 가능합니다.');
		window.open("login.do", "질문글 답변하기", "_blank");
	}
}

function modifyQna(qna_no, product_no) {
	window.open("product_qna_modify.do?no="+qna_no+"&pno="+product_no, "질문글 수정하기", "_blank");
}

function deleteQna(qna_no, product_no){
	if(confirm('삭제하시겠습니까?')){
		location.href="qna_delete.do?no="+qna_no+"&pno="+product_no;
	}
}

function answerQna(qna_no, product_no){
	window.open("product_qna_answer.do?no="+qna_no+"&pno="+product_no, "질문글 답변하기", "_blank");
}

function showReview(id){
	$('#review-'+id).toggle();
	$('#review-detail-'+id).toggle();
	$('#reviews-'+id).toggle();
	$('#reviews-detail-'+id).toggle();
}

 
function addLike(product_no){
	$.ajax({
		type : "post",
		url : "add_like.do",
		data : {"no":product_no},
		success : function(data) {
			if(data == 1){
				$("#like-btn").css({"color":"red"});
				return false;
			}else if(data == 2){
				$("#like-btn").css({"color":"black"});
				return false;
			}else {
				console.log("data" + data);
				alert('에이젝스 실패');
			}
		},
		error: function(request,status,error) {
			alert("통신 오류입니다.");
		}
	});
}


// product_list

function addLikey(product_no, index){
	$.ajax({
		type : "post",
		url : "add_like.do",
		data : {"no":product_no},
		success : function(data) {
			if(data == 1){
				$("#like-btn-"+index).css({"color":"red"});
				return false;
			}else if(data == 2){
				$("#like-btn-"+index).css({"color":"black"});
				return false;
			}else {
				console.log("data" + data);
				alert('에이젝스 실패');
			}
		},
		error: function(request,status,error) {
			alert("통신 오류입니다.");
		}
	});
}


// cart

function resetCart() {
	if(confirm("장바구니를 비우시겠습니까?")){
        location.href="cart_reset.do";
    }
};

function checkAll() {  /* 체크박스 전체선택 함수 */
	$('input[name=check]').prop('checked', $('#checkAll').prop('checked'));
};


//recent

function closeRecent(){
	if(document.getElementById('recent').style.display == 'block'){
		document.getElementById('recent').style.display = 'none';
		document.getElementById('x-div').style.display = 'block';
	}else{
		document.getElementById('recent').style.display = 'block';
		document.getElementById('x-div').style.display = 'none';
	}
}