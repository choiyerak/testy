package kr.co.group.pay;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import kr.co.group.admin.AdminDAO;
import kr.co.group.order.OrderDTO;
import retrofit2.http.POST;

@RequestMapping("pay")
@Controller
public class PayCont {
	
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private PayDAO pdao;
	
	public PayCont() {
		System.out.println("-----PayCont() 객체 생성함");
	} // 생성자 ends
	
	@GetMapping("/order")
	public ModelAndView home(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pay/order");
		
		String[] sin_codes = req.getParameterValues("sin_code");
		
		List<PayDTO> list = pdao.order("20230819-185614");
		System.out.println(list);
		
		int totalRowCount = pdao.totalRowCount();
		
		mav.addObject("list", list);
		mav.addObject("count", totalRowCount);
		return mav;
	} // home() ends 
	
	// example
	@GetMapping("/example")
	public String example() {
		return "pay/example";
	} // example();
	
	@PostMapping("/example")
	public ModelAndView incomplete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pay/example");
		
		return mav;
	} //
	
	
} // class ends

