// 주문번호 만들기
function createOrderNum(){
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	
	let orderNum = year + month + day;
	for(let i=0;i<10;i++) {
		orderNum += Math.floor(Math.random() * 8);	
	}
	return orderNum;
}

function proceedPay(order_class, order_total, order_status, u_id) {
    $.ajax({
        url: '/payment/proceed',
        type: 'POST',
        // async: true,
        dataType: 'json',
        //data: $('#orderForm').serialize(),
        data : {
			order_no: createOrderNum(),
			order_class: order_class,
			order_total: order_total,
			order_status: order_status,
			u_id : u_id, // 주문자  
		},
        success: function (data) {
            if (data.cnt > 0) {
                requestPay(data);
            } else {
                alert(data.msg);
            }
        },
        error: function (e) {
            alert('에러');
        }
    });
} // proceedPay() ends 



var IMP = window.IMP;
IMP.init("imp57142651");

function requestPay(data) {       
IMP.request_pay({
	// 결제에 전달되는 내용
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid: data.no, // 상점에서 관리하는 주문 번호
    name : data.class,
    amount : data.price,
    buyer_email : '',
    buyer_name : data.id,
    // buyer_tel : '010-1234-5678',
    // buyer_addr : '서울특별시 강남구 삼성동',
    // buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	$.ajax({
            url: "/payment/verify/" + rsp.imp_uid,
            type: "POST",
    	}).done(function(data) {
			// 결제 검증 : 결제성공시의 금액(rsp.paid_amount)과 검증한 금액(data.response.amount) 비교 
			if(rsp.paid_amount == data.response.amount){
				//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				var msg = '결제가 완료되었습니다.';
    			msg += '\n 고유ID : ' + rsp.imp_uid;
    			msg += '\n 상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\n 결제 금액 : ' + rsp.paid_amount;
    			msg += '\n 카드 승인번호 : ' + rsp.apply_num;
    			
    			alert(msg);
    			
    			succeedPay(rsp.imp_uid, rsp.merchant_uid);
			} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    			alert("결제 검증 실패");
    		}
    	});
    } else {
		
        var msg = '결제에 실패하였습니다.\n';
        msg += '에러내용 : ' + rsp.error_msg;
        
        alert(msg);
    }
});
}

function succeedPay(imp_uid, merchant_uid){
	$.ajax({
		url: '/payment/succeed',
		type: 'POST',
		async: true,
		dataType: 'Json',
		data : {
			imp_uid: imp_uid,
			merchant_uid: merchant_uid
		}, 
		success: function(data){
			if(data.cnt > 0){
				let msg = "결제 및 검증이 완료되었습니다."
				alert(msg);
				location.href="/mypage/order"
			} else {
				let msg="결제가 완료되었으나 에러가 발생했습니다."
				alert(msg);
				location.href="/mypage/order";
			}
		}, // success ends
		error : function(e){
			alert("에러");
		}  // error ends 
	}) // ajax ends 
} // succeedPay() ends 