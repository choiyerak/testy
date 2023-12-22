package kr.co.group.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class UserCont {
	
	public UserCont() {
		System.out.println("-----UserCont() 객체 생성");
	} // 생성자 ends 
	
	@Autowired
	private UserDAO dao;
	
	
	// 로그인 페이지로 이동 : http://localhost:9095/login
	@GetMapping("/login") // /WEB-INF/views/login.jsp
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login"); //
		
		return mav;
	} // login() ends 
	
	@PostMapping("/login")
	public String loginProc(HttpServletRequest req) {
		String u_id = req.getParameter("u_id");
		String u_pw = req.getParameter("u_pw");
		UserDTO udto = new UserDTO();
	} // loginProc() ends 
	
	// 회원 가입 페이지로 이동 : http://localhost:9095/join
	@GetMapping("/join")
	public String join() {
		return "login/joinForm";
	} // join() ends 
	
	// 회원 가입 페이지에서 회원등록 버튼을 누르면 정보가 db로 전달됨
	@PostMapping("/join")
	public ModelAndView join(@ModelAttribute UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt  = dao.create(dto);
			
		if(cnt == 0) {
			// 회원가입 실패시 회원가입 페이지로 이동
			mav.setViewName("redirect:/join");
		} else {
			// 회원가입 성공시 로그인 페이지로 이동
			mav.setViewName("login/login");
		} // if ends : 회원가입 여부 확인
		
		return mav;
	} // join() ends

	
} // class ends 
