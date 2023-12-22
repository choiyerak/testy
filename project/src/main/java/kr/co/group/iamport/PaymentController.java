package kr.co.group.iamport;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping("/payments")
@RestController
public class PaymentController {
	// 토큰 발급을 위해 아임포트에서 제공하는 rest  api 사용 (의존성 추가 필요)
	private IamportClient iamportClient;
	
	@Value("${imp.api.key}")
	private String apiKey;
	
	@Value("${imp.api.secretkey}")
	private String secretKey;
	
	public PaymentController() {
		this.iamportClient = new IamportClient(apiKey, secretKey);
	}
	
	
}
