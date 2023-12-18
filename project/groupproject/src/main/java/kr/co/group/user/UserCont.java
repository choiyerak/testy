package kr.co.group.user;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserCont {
	
	public UserCont() {
		System.out.println("-----UserCont() 객체 생성");
	} // 생성자 ends 
	
	@Autowired
	private UserDAO dao;
	
	// 회원 가입 페이지로 이동 
	@GetMapping("/join")
	public String join() {
		return "/login/joinForm";
	} // join() ends 
	
	/*
	@GetMapping("idcheckform.do")
	public String idCheckForm() {
		return "login/idCheck";
	} // idCheckForm() end
	
	@PostMapping("idcheckproc")
	@ResponseBody
	public String idCheckProc(HttpServletRequest req) {
		
		String userid=req.getParameter("userid").trim();
		String message="";
		
		if(userid.length()<5 || userid.length()>15) {
			message = "<span style='color:blue;font-weight:bold'>아이디는 5~15글자 이내로 입력해주세요</span>";
		}else {
			if(userid.equals("itwill") || userid.equals("webmaster")) {
				message = "<span style='color:red;font-weight:bold'>중복된 아이디입니다</span>";
			}else {
				message = "<span style='color:green;font-weight:bold'>사용가능한 아이디입니다</span>";
			} // if end
		} // if end
		
		return message;
		
	} // idCheckProc() end
	
	// 쿠키를 활용하여 아이디 중복확인을 해야만 회원가입이 가능
	@GetMapping("idcheckcookieform")
	public String idCheckCookieForm() {
		return "/login/idCheck_cookie";
	} // idCheckCookieForm() end
	
	@PostMapping("idcheckcookieproc")
	@ResponseBody
	public String idCheckCookieProc(HttpServletRequest req) {
		
		String userid=req.getParameter("userid").trim();
		String cnt="0";
		
		if(userid.equals("itwill")||userid.equals("webmaster")) {
			cnt="1";	// 아이디가 중복되었음
		} // if end
		
		// 1) text 응답 ------------------------------------------------------------------
		// return cnt;
		
		// 2) JSON 응답 ------------------------------------------------------------------
		// https://mvnrepository.com에서 json-simple검색후, pom.xml에 의존성 추가해야 함
		JSONObject json = new JSONObject();
		json.put("count", cnt);	// key, value
		return json.toString();
	} // idCheckCookieProc() end
	*/
	
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
			mav.setViewName("/login");
		} // if ends : 회원가입 여부 확인
		
		return mav;
		
	} // join() ends 
}