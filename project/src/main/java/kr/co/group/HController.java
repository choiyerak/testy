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
	@GetMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav =new ModelAndView();
		
		//application.properties 환경설정 참조
		// /WEB-INF/views/start.jsp	
		mav.setViewName("start");
		
		//뷰페이지(start.jsp)와 값을 공유하기 위해 request전역변수 활용하기
		//request.setAttribute()와 동일한 기능이 함수
		mav.addObject("message", "어서오세요!!");
		mav.addObject("img", "<img src='images/mouse.png'>");
		
		
		
		return mav;
	}//home end
	
	
}//class end


