package kr.co.group.center;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CenterCont {


		public CenterCont() {
			System.out.println("-----CenterCont() 객체 생성됨");
		} // constructor ends 

		@GetMapping("/center") //명령어 등록 
		public ModelAndView center() {
			
			// application.properties 환결 설정 파일의 prefix와 suffix값을 조합해서 뷰페이지 완성
			ModelAndView mav = new ModelAndView();
			mav.setViewName("cent/center"); // /WEB-INF/views/center.jsp
			
		
			return mav;
			
		} // center() ends 
		
}
