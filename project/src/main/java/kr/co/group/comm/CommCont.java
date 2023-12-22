package kr.co.group.comm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("comm")
@Controller
public class CommCont {
	
	public CommCont() {
		System.out.println("-----CommCont() 객체 생성됨");
	} // 생성자 ends
	
	@GetMapping("/home")
	public String home() {
		return "comm/commHome";
	} // home() ends 
	
} // class ends 
