package kr.co.group.test;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	public HelloController() {
		System.out.println("-----HelloController() 객체 생성됨");
	} // constructor ends 

	@GetMapping("/home") //명령어 등록 
	public ModelAndView hello() {
		
		// application.properties 환결 설정 파일의 prefix와 suffix값을 조합해서 뷰페이지 완성
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home"); // /WEB-INF/views/main.jsp
		
		// 서로 다른 페이지들간에 값을 공유하기 위한 전역변수 
		// request, session, application 
				
				// requset.setAttribute() 함수와 동일  
				mav.addObject("message", "<p>환영합니다</p><p>Welcome to MyHome!!</p>");
		
		return mav;
		
	} // hello() ends 
	
 

} // class ends 