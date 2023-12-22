package kr.co.group.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeCont {

		public HomeCont() {
			System.out.println("-----HomeCont() 객체 생성됨");
		} // constructor ends 

		@GetMapping("/home") //명령어 등록 
		public ModelAndView hello() {
			
			// application.properties 환결 설정 파일의 prefix와 suffix값을 조합해서 뷰페이지 완성
			ModelAndView mav = new ModelAndView();
			mav.setViewName("home/home"); // /WEB-INF/views/main.jsp
			
			return mav;
			
		} // index.do ends 
		
		
		@GetMapping("/home/map")
		public String map() {
			return "/home/map";
		} // map() ens 
} // HomeCont() ends 
