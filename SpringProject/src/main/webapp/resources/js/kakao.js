$('#pay_button').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_buyer_name = $("#name").val();
	var input_buyer_tel = $("#phone").val();
	var input_buyer_postcode = $("#zip").val();
	var input_buyer_addr = $("#addr").val();
	var input_name = $("#cont").val();
	var input_amount = $("#price").val();
	
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
			
			$('#form').submit();

		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});

//정기결제를 위한 빌링키 발급과 동시에 첫 결제
/*$('#pay_button2').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_customer_uid = $("#id").val();
	var input_name = $("#cont").val() + ' 정기 결제';
	var input_amount = $("#price").val();
	var input_buyer_name = $("#name").val();
	var input_buyer_tel = $("#phone").val();
	var input_buyer_addr = $("#addr").val();
	var input_buyer_postcode = $("#zip").val();
	
	var form = document.getElementById("form");

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
			// jQuery로 HTTP 요청
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
			})

			alert('빌링키 발급 성공');

			form.submit();
		} else {
			alert("빌링키 발급 실패. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});*/

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
    
    if(!input_buyer_name || !input_buyer_tel || !input_buyer_postcode){
        alert("모든 항목을 입력하세요.")
    }else{
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
	
				$('#form').submit();
	
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				// 실패시 이동할 페이지
				location.href = "payFail.do";
			}
		});
    }
});

//정기결제를 위한 빌링키 발급과 동시에 첫 결제
/*$('#pay_button2_new').click(function() {
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init('imp24700315'); // 발급받은 "가맹점 식별코드"를 사용합니다.

	var input_customer_uid = $("#id").val();
	var input_name = $("#cont").val() + ' 정기 결제';
	var input_amount = $("#price").val();
	var input_buyer_name = $("#new_name").val();
	var input_buyer_tel = $("#new_phone").val();
	var input_buyer_addr = $("#new_addr").val() + $("#new_addr_detail").val();
	var input_buyer_postcode = $("#new_zip").val();
	
	var form = document.getElementById("form");

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
			// jQuery로 HTTP 요청
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
			})

			
			alert('빌링키 발급 성공');
			
			form.submit();
		} else {
			alert("빌링키 발급 실패. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});*/

//정기결제 취소

//카카오 플친 1:1 상담
