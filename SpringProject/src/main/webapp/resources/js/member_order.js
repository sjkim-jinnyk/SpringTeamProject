const threeMonth = document.querySelector('#threeMonth');	// 3개월 선택
const oneMonth = document.querySelector('#month');			// 1개월 선택
const sevenDay = document.querySelector('#sevenDay');		// 일주일 선택
const allDay = document.querySelector('#allDay');			// 전체시기 선택

/* 현재 날짜를 불러오는 함수 */
function getToday() {
	let date = new Date();
	return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
}

/* 일주일 전 날짜를 불러오는 함수 */
function getSeven() {
	let date = new Date();
	return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+(date.getDate()-7)).slice(-2);
}

/* 1개월 전 날짜를 불러오는 함수 */
function getMonth() {
	let date = new Date();
	return date.getFullYear() + "-" + ("0"+(date.getMonth())).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
}

/* 3개월 전 날짜를 불러오는 함수 */
function getThreeMonth() {
	let date = new Date();
	return date.getFullYear() + "-" + ("0"+(date.getMonth()-2)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
}

// 3개월 클릭시
threeMonth.addEventListener('click', function() {
	let three = getThreeMonth();
	let today = getToday();
	document.orderForm.orderFirst.value = three;
	document.orderForm.orderLast.value = today;
	
	threeMonth.classList.replace('off','on');
	allDay.classList.replace('on','off');
	oneMonth.classList.replace('on','off');
	sevenDay.classList.replace('on','off');
});

// 1개월 클릭시
oneMonth.addEventListener('click', function() {
	let one = getMonth();
	let today = getToday();
	document.orderForm.orderFirst.value = one;
	document.orderForm.orderLast.value = today;
	
	threeMonth.classList.replace('on','off');
	allDay.classList.replace('on','off');
	oneMonth.classList.replace('off','on');
	sevenDay.classList.replace('on','off');
});

// 일주일 클릭시
sevenDay.addEventListener('click', function() {
	let seven = getSeven();
	let today = getToday();
	document.orderForm.orderFirst.value = seven;
	document.orderForm.orderLast.value = today;
	
	threeMonth.classList.replace('on','off');
	allDay.classList.replace('on','off');
	oneMonth.classList.replace('on','off');
	sevenDay.classList.replace('off','on');
});

// 전체시기 클릭시
allDay.addEventListener('click', function() {
	let past = '2021-01-01';
	let today = getToday();
	let id = $("#mem_id").text();
	
	threeMonth.classList.replace('on','off');
	allDay.classList.replace('off','on');
	oneMonth.classList.replace('on','off');
	sevenDay.classList.replace('on','off');
	
	$.ajax({
		type : "post",
		url : "./member_order.do",
		dataType: "text", 
		data : {
			"id" : id
		},
		success : function(data) {
			document.orderForm.orderFirst.value = data;
			document.orderForm.orderLast.value = today;
		},
		error : function() {
			alert('오류');
		}
	});
	
});
