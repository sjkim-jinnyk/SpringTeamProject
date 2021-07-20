$('#pay_button').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_name = $("#cont").val();
	var input_amount = $("#price").val();
	var input_buyer_name = $("#name").val();
	var input_buyer_tel = $("#phone").val();
	var input_buyer_addr = $("#addr").val();
	var input_buyer_postcode = $("#zip").val();

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		pg : 'kakaopay',
		pay_method : 'card',
		merchant_uid : 'kakao_' + new Date().getTime(),	// merchant_uid로 주문번호 구분, 이미 있는 번호일 경우 iamport에서 결제 거부
		name : input_name,
		amount : input_amount,
		buyer_name : input_buyer_name,
		buyer_tel : input_buyer_tel,
		buyer_addr : input_buyer_addr,
		buyer_postcode : input_buyer_postcode,
	}, function(rsp) { // callback
		if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			/*// jQuery로 HTTP 요청
			jQuery.ajax({
				url : "https://www.myservice.com/payments/complete", // 가맹점서버
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid
				}
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직
			})*/

			alert('결제 성공');
			// 성공시 이동할 페이지
			location.href = 'paySuccess.do';
		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});

//정기결제를 위한 빌링키 발급과 동시에 첫 결제
$('#pay_button2').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_customer_uid = $("#id").val();
	var input_name = $("#cont").val() + ' 정기 결제';
	var input_amount = $("#price").val();
	var input_buyer_name = $("#name").val();
	var input_buyer_tel = $("#phone").val();
	var input_buyer_addr = $("#addr").val();
	var input_buyer_postcode = $("#zip").val();

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		pg : 'kakaopay.TCSUBSCRIP',	// 카카오페이 정기결제용 테스트CID, 단건결제용 CID과 구분하기 위해 뒤에 '.TCSUBSCRIP'을 붙여줌
		pay_method : 'card',	// 결제창 호출단계에서의 pay_method 는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
		merchant_uid : 'kakao_' + new Date().getTime(),	// merchant_uid로 주문번호 구분, 이미 있는 번호일 경우 iamport에서 결제 거부
		name : input_name,
		amount : input_amount,
		customer_uid : input_customer_uid,	//customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
		buyer_name : input_buyer_name,
		buyer_tel : input_buyer_tel,
		buyer_addr : input_buyer_addr,
		buyer_postcode : input_buyer_postcode,
	}, function(rsp) { // callback
		if (rsp.success) { // 결제 성공 시: 빌링키 발급 및 정기결제를 위한 스케쥴러 등록 필요
			/*// jQuery로 HTTP 요청
			jQuery.ajax({
				url : "https://www.myservice.com/payments/complete", // 가맹점서버
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid
				}
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직
			})*/

			// 성공시 이동할 페이지
			alert('빌링키 발급 성공');
			location.href = 'paySuccess.do';
		} else {
			alert("빌링키 발급 실패. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});

//new
$('#pay_button_new').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_name = $("#cont").val();
	var input_amount = $("#price").val();
	var input_buyer_name = $("#new_name").val();
	var input_buyer_tel = $("#new_phone").val();
	var input_buyer_addr = $("#new_addr").val() + $("#new_addr_detail").val();
	var input_buyer_postcode = $("#new_zip").val();

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		pg : 'kakaopay',
		pay_method : 'card',
		merchant_uid : 'kakao_' + new Date().getTime(),	// merchant_uid로 주문번호 구분, 이미 있는 번호일 경우 iamport에서 결제 거부
		name : input_name,
		amount : input_amount,
		buyer_name : input_buyer_name,
		buyer_tel : input_buyer_tel,
		buyer_addr : input_buyer_addr,
		buyer_postcode : input_buyer_postcode,
	}, function(rsp) { // callback
		if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			/*// jQuery로 HTTP 요청
			jQuery.ajax({
				url : "https://www.myservice.com/payments/complete", // 가맹점서버
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid
				}
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직
			})*/

			alert('결제 성공');
			// 성공시 이동할 페이지
			location.href = 'paySuccess.do';
		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});

//정기결제를 위한 빌링키 발급과 동시에 첫 결제
$('#pay_button2_new').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_customer_uid = $("#id").val();
	var input_name = $("#cont").val() + ' 정기 결제';
	var input_amount = $("#price").val();
	var input_buyer_name = $("#new_name").val();
	var input_buyer_tel = $("#new_phone").val();
	var input_buyer_addr = $("#new_addr").val() + $("#new_addr_detail").val();
	var input_buyer_postcode = $("#new_zip").val();

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		pg : 'kakaopay.TCSUBSCRIP',	// 카카오페이 정기결제용 테스트CID, 단건결제용 CID과 구분하기 위해 뒤에 '.TCSUBSCRIP'을 붙여줌
		pay_method : 'card',	// 결제창 호출단계에서의 pay_method 는 아무런 역할을 하지 못하며, 구매자가 카카오페이 앱 내에서 신용카드 vs 카카오머니 중 실제 선택한 값으로 추후 정정됩니다.
		merchant_uid : 'kakao_' + new Date().getTime(),	// merchant_uid로 주문번호 구분, 이미 있는 번호일 경우 iamport에서 결제 거부
		name : input_name,
		amount : input_amount,
		customer_uid : input_customer_uid,	//customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
		buyer_name : input_buyer_name,
		buyer_tel : input_buyer_tel,
		buyer_addr : input_buyer_addr,
		buyer_postcode : input_buyer_postcode,
	}, function(rsp) { // callback
		if (rsp.success) { // 결제 성공 시: 빌링키 발급 및 정기결제를 위한 스케쥴러 등록 필요
			/*// jQuery로 HTTP 요청
			jQuery.ajax({
				url : "https://www.myservice.com/payments/complete", // 가맹점서버
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid
				}
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직
			})*/

			// 성공시 이동할 페이지
			alert('빌링키 발급 성공');
			location.href = 'paySuccess.do';
		} else {
			alert("빌링키 발급 실패. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});

//정기결제 취소

//카카오 플친 1:1 상담

//다음 주소
function sample6_execDaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        	 var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("new_addr_detail").value = extraAddr;
             
             } else {
                 document.getElementById("new_addr_detail").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('new_zip').value = data.zonecode;
             document.getElementById("new_addr").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("new_addr_detail").focus();
         }
     }).open();
}