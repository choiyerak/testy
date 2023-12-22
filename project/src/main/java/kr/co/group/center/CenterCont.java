package kr.co.group.center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class CenterCont {


	@Autowired
	TeacherDAO teacherDAO; 
	
	
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

		@GetMapping("/teacher") //명령어 등록 
		public ModelAndView teacher() {
			
			// application.properties 환결 설정 파일의 prefix와 suffix값을 조합해서 뷰페이지 완성
			ModelAndView mav = new ModelAndView();
			mav.setViewName("cent/teacher"); // /WEB-INF/views/teacher.jsp
			
		
			return mav;
			
		} // teacher() ends 
		
		
		@GetMapping("/teacherproc")
	    public ModelAndView teacherproc(@RequestParam String t_id) {
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("cent/teacherproc");


	        // 강사 정보를 가져오는 DAO 로직은 여기서 처리
	        TeacherDTO teacher = teacherDAO.getTeacher(t_id);

	        // 모델에 데이터 추가
	        mav.addObject("teacher", teacher);

	        return mav;
	    } // teacherproc() ends 
		
		
		
//		@PostMapping("/teacher")
//		public ModelAndView list(@RequestParam(name = "centers", required = false) String centerCode) {
//		    ModelAndView mav = new ModelAndView();
//		    System.out.println(centerCode);
//		   // 센터 코드에 따라 센터 정보를 가져오도록 수정
//		   List<TeacherDTO> teacherList = teacherDAO.list(centerCode);
//		    mav.setViewName("cent/teacher");
//		    mav.addObject("list", teacherList);
//		    mav.addObject("c_no", centerCode); // 센터 코드 전달
//		    System.out.println(teacherList);
//		    return mav;
//		}//list end
//		
			
			
	
		@PostMapping("/teacher")
		@ResponseBody
		public List<TeacherDTO> loadTeachers(@RequestParam(name = "centerCode", required = true) String centerCode) throws Exception {
			//System.out.println(teacherDAO.list(centerCode));
			return teacherDAO.list(centerCode);
		    
		}//loadTeachers() end
		   
		  
}	


