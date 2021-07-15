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

			// 성공시 이동할 페이지
			location.href = 'paySuccess.do';
		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			// 실패시 이동할 페이지
			location.href = "payFail.do";
		}
	});

});