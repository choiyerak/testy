package kr.co.group.order;

import java.io.IOException;
import java.net.http.HttpClient;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.group.iamport.IamportCont;
import kr.co.group.iamport.IamportDTO;
import kr.co.group.utility.MyAuthenticator;

@RequestMapping("/payment")
@Controller
public class OrderCont {
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	private IamportCont iamport;
	
	public OrderCont() {
		System.out.println("-----OrderCont() 객체 형성됨");
	} // constructor ends 
	
	
	@PostMapping("/proceed")
	@ResponseBody
	public Map<Object, Object> paymentOK(@ModelAttribute OrderDTO odto) throws IOException{
		Map<Object, Object> map = null;
		// 전달받은 값 확인하기 
		System.out.println(odto);

		String token = iamport.getToken();
		System.out.println(token);
		
		// 전달 받은 값 서버에 저장 
		int cnt = odao.create(odto);
		map = new HashMap<>();
		if(cnt == 0) { 
			System.out.println("주문 실패");
			map.put("cnt", 0);
			map.put("msg", "주문이 실패했습니다.");
		} else { // 주문 성공시 해당 데이터를 map에 담음 
			System.out.println("주문 성공");
			
			map.put("cnt", 1);
			map.put("no", odto.getOrder_no());
			map.put("class", odto.getOrder_class());
			map.put("price", odto.getOrder_total());
			map.put("id", odto.getU_id());
			System.out.println(map);
		} // if ends : 주문 성공 여부 확인 
		
		return map;
	} // paymentOK() ends
	
	// 결제 성공시 
	@PostMapping("/succeed")
	@ResponseBody
	public Map<Object, Object> updateStatus(HttpServletRequest req){
		Map<Object, Object> map = null;
		
		String imp_uid = req.getParameter("imp_uid");
		String order_no = req.getParameter("merchant_uid");
		String order_status = "결제 완료";
		
		OrderDTO odto = new OrderDTO();
		odto.setOrder_imp_uid(imp_uid);
		odto.setOrder_no(order_no);
		odto.setOrder_status(order_status);
		
		map = new HashMap<>();
		
		int cnt = odao.updateStatus(odto);
		
		if(cnt > 0) {
			map.put("cnt", 1);
			
			// 결제 내용 이메일 발송 
			// 메일 서버 정보 입력
			String mailServer = "mw-002.cafe24.com"; // cafe24 메일 서버 
			Properties props = new Properties();
			props.put("mail.smtp.host", mailServer);
			props.put("mail.smtp.auth", true);
			
			Authenticator myAuth = new MyAuthenticator();
			
			Session sess = Session.getInstance(props, myAuth);
			
			String email = "sleepynara@daum.net";
			
			String to = email;
			String from = email;
			String subject = "결제 완료 이메일";
			String content = "주문 번호" + order_no; 
			
			try {
				InternetAddress[] address = {new InternetAddress(to)};
				Message msg = new MimeMessage(sess);
				msg.setRecipients(Message.RecipientType.TO, address);
				
				msg.setFrom(new InternetAddress(from));
				
				msg.setSubject(subject);
				msg.setContent(content, "text/html; charset=UTF-8");
				
				msg.setSentDate(new Date());
				
				Transport.send(msg);
				
			} catch (Exception e) {
				
				System.out.println("이메일 전송 실패" + e);
				
			} // try- catch ends 
		} else {
			map.put("cnt", 0);
		} // if ends 결제 상태 변경 여부 확인 
		
		return map;
	} // updateStatus() ends 
	
	// 결제 취소시
	@CrossOrigin(origins = "http://localhost:9095")
	@PostMapping("/cancel")
	@ResponseBody
	public Map<String, Object> cancel(@ModelAttribute OrderDTO odto) throws IOException {
		Map<String, Object> map = null;
		
		System.out.println(odto);
		
		map = odao.checkPay(odto);
		System.out.println(map);
		
		String imp_uid = (String) map.get("order_imp_uid");
		Long orderTotal = (Long) map.get("order_total");
		int order_total = Math.toIntExact(orderTotal);
		
		
		map = new HashMap<>();
		if(order_total <= 0) {
			map.put("cnt", 0);
			map.put("msg", "이미 전액 환불 되었습니다.");
		} else {
			map.put("cnt", 1);
			map.put("imp_uid", imp_uid);
			map.put("amout", order_total);
		} // if ends 
		
		return map;
	} // cancel() ends 
} // class ends 
