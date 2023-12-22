function getToken(order_no, order_total){
	$.ajax({
		url:"/user/geToken",
		type: "Post",
		data:{
			order_no: order_no,
			order_total: order_total,
		},
		success: function(data){
			alret(data.token);
		}
	});
}

function cancelPay(order_no, order_total){
	$.ajax({
		url : "/payment/cancel",
		type : "POST",
		dataType: "json",
		data : {
			order_no: order_no,
			order_total: order_total,
		}, // 전달되는 데이터 
		success: function(data){
			if(data.cnt>0){
				alert(data.cnt);
				refundPay(data);
			} else {
				
			} // if ends 
		}, // success ends
		error: function (e){
			console.log("에러" + e);
		}  // error ends 
	}); // ajax ends 
} // cancelPay() ends 

function refundPay(rsp){
	$.ajax({
		url: "https://api.iamport.kr/payments/cancel",
		method: "POST",
		data: {
			imp_uid: rsp.imp_uid,
			amount: rsp.order_no,
		}
	}).done(function(data){
		refuncdProceed(rsp.imp_uid);
	}); // ajax ends 
} // refundPay() ends 

function refundProceed(imp_uid){
	$.ajax({
		url: "/payment/refund",
		type:'POST',
		async: true,
		dataType: 'Json',
		data:{
			imp_uid: imp_uid,
		},
		success:function(data){
			if(data.cnt > 0){
				let msg = "환불이 완료되었습니다."
				alert(msg);
			} else {
				let msg = "환불이 완료되었으나 에러가 발생했습니다.."
				alert(msg);
			} // if ends 
		}, // success() ends
		error: function(error){
			alert("에러" + error);
		}  // error ends 
	}); // ajax ends 
} // refundProceed() ends 
function getToken(data){
	$.ajax({
		url: "https://api.iamport.kr/users/getToken",
		method: "post",
		headers: { "Content-Type": "application/json" },
		data: {
          imp_key: "imp_apikey", // REST API키
          imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f" // REST API Secret
        },
        success: function(data){
			console.log(data);
		}
	});
}