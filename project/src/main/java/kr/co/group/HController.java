package kr.co.group;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HController {
	
	public HController() {
		System.out.println("-----HController()객체 생성됨");
	}//end
	
	
	//요청 명령어 등록하고, 실행의 주체는 메소드 (함수)
	
	//결과확인 http://localhost:9095/home.do
	@GetMapping("/sugang")
	public ModelAndView home() {
		ModelAndView mav =new ModelAndView();
		
		//application.properties 환경설정 참조
		// /WEB-INF/views/start.jsp	
		mav.setViewName("test");
		
	
		
		
		return mav;
	}//home end
	
	
}//class end


