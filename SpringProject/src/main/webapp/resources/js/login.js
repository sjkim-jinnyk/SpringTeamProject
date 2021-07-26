// 아이디 중복 체크
// 참고 : https://yejip.com/web/2020-12-15-%EA%B2%8C%EC%8B%9C%ED%8C%90ajax1/
$(function(){
	$("#mem_id").on('keyup',fn_idCheck);
})

function fn_idCheck(){
    var mem_id = $("#mem_id").val();
    var sendData = {"mem_id":mem_id}
    
    $.ajax({
        method : 'POST',
        url : 'id_check',
        data : sendData,
        success : function(resp){
            if(resp=='fail'){
                $('#id_check_txt').css('color','red')
                $('#id_check_txt').html("사용할 수 없는 아이디입니다.")
                flag=false;
  
            }else{
                $('#id_check_txt').css('color','blue')
                $('#id_check_txt').html("사용가능한 아이디입니다.")
                flag=true;
            }}
    })	
}

// 전화번호 중복 체크
//$(function(){
//	$("#mem_phone").on('mouseleave',fn_phoneCheck);
//})
//
//function fn_phoneCheck(){
//    var mem_phone = $("#mem_phone").val();
//    var sendData = {"mem_phone":mem_phone}
//    
//    $.ajax({
//        method : 'POST',
//        url : 'phone_check',
//        data : sendData,
//        success : function(resp){
//            if(resp=='fail'){
//                $('#phone_check_txt').css('color','red')
//                $('#phone_check_txt').html("사용할 수 없는 전화번호입니다.")
//                flag=false;
//  
//            }else{
//                $('#phone_check_txt').css('color','blue')
//                $('#phone_check_txt').html("사용가능한 전화번호입니다.")
//                flag=true;
//            }}
//    })	
//}

// 아이디(4자리 이상 15자리 미만), 전화번호 (000-0000-0000) 형식 검사
// 참고 : https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=irene-fts&logNo=221898756777
function submitCheck(){
	var phoneReg = /(01[016789])-\d{4}-\d{4}/g;
	
	if(!phoneReg.test(joinForm.mem_phone.value)) {
		alert("전화번호를 형식에 맞게 입력해주세요.");
		joinForm.mem_phone.focus();
		return;
	}
	
	joinForm.method = "post";
	joinForm.action = "/member/join_ok.do";
	joinForm.submit();
}

function phoneCheck(){
	var phoneReg = /(01[016789])-\d{4}-\d{4}/g;
	
	if(!phoneReg.test(find_id.mem_phone.value)) {
		alert("전화번호를 형식에 맞게 입력해주세요.");
		find_id.mem_phone.focus();
		return;
	}
	
	find_id.method = "post";
	find_id.action = "/member/find_id_ok.do";
	find_id.submit();
}

// 도로명 주소  다음 API 스크립트
// 참고 : https://postcode.map.daum.net/guide#sample
// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	 new daum.Postcode({
		  oncomplete: function(data) {
		      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		      var roadAddr = data.roadAddress; // 도로명 주소 변수
		      var extraRoadAddr = ''; // 참고 항목 변수
		
		      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		          extraRoadAddr += data.bname;
		      }
		      // 건물명이 있고, 공동주택일 경우 추가한다.
		      if(data.buildingName !== '' && data.apartment === 'Y'){
		         extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		      }
		      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		      if(extraRoadAddr !== ''){
		          extraRoadAddr = ' (' + extraRoadAddr + ')';
		      }
		
		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById('sample4_postcode').value = data.zonecode;
		      document.getElementById("sample4_roadAddress").value = roadAddr;
		      
		      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		      if(roadAddr !== ''){
		          document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		      } else {
		          document.getElementById("sample4_extraAddress").value = '';
		      }
		
		      var guideTextBox = document.getElementById("guide");
		      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		      if(data.autoRoadAddress) {
		          var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		          guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		          guideTextBox.style.display = 'block';
		
		      } else if(data.autoJibunAddress) {
		          var expJibunAddr = data.autoJibunAddress;
		          guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		          guideTextBox.style.display = 'block';
		      } else {
		          guideTextBox.innerHTML = '';
		          guideTextBox.style.display = 'none';
		      }
		  }
	  }).open();
}
