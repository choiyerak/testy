package kr.co.group.pay;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RequestMapping("/pay")
@RestController
public class PayController {
	
	// 토큰 발급을 위해 아임포트에서 제공하는 rest  api 사용 (의존성 추가 필요)
	private IamportClient iamportClient;
	
	@Value("${imp.api.key}")
	private String apiKey;
	
	@Value("${imp.api.secretkey}")
	private String secretKey;
	
	// 생성자로 rest api key와 secret을 입력해서 토큰 바로생성.
	public PayController(){
		System.out.println("-----PayController() 객체 생성됨");
		this.iamportClient = new IamportClient(apiKey, secretKey);
	} // constructor ends 
	
	// impUid로 결제 내역 조회
	@PostMapping("/payments/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(@PathVariable(value="imp_uid") String impUid) throws IamportResponseException, IOException{
		return iamportClient.paymentByImpUid(impUid);
	} // paymentLookup() ends  
	
	// impUid를 결제 번호로 찾고, 조회해야 하는 경우 오버로드 : paymentsinfo 완성 후  
	// public IamportResponse<Payment> paymentLookup(long paymentsNo) throws IamportResponseException, IOException{
	// 	PaymentsInfo paymentsInfo = PaymentService.paymemtLookupService(paymentsNo);
	// 	return iamportClient.paymentByImpUid(paymentsInfo.getImpUid());
	// } // paymentLookup() ends
	
	@GetMapping("/payments/{imp_uid}")
	public String payments() {
		return "/pay/payments";
	} // payments
	
} // class ends 
