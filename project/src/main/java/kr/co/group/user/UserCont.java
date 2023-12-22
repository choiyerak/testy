package kr.co.group.user;

<<<<<<< HEAD
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
=======

import java.util.List;

>>>>>>> 59114d0c28a67bc88e76599c07e67d66141c0961
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
=======
>>>>>>> 59114d0c28a67bc88e76599c07e67d66141c0961
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.group.utility.MyAuthenticator;
import kr.co.group.utility.Utility;


@Controller
@SessionAttributes({"s_id"})
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
<<<<<<< HEAD
			mav.setViewName("redirect:/login");
		} // if ends : 회원가입 여부 확인
		
		return mav;
		
	} // join() ends
	
	@GetMapping("idcheckform.do")
	public String idCheckForm() {
		return "login/idCheck";
	} // idCheckForm() end
	
	@PostMapping("idcheckproc")
	@ResponseBody
	public String idCheckProc(HttpServletRequest req) {
		String cnt = "0"; 
		String userid=req.getParameter("userid");
		//System.out.println(userid);
		String message="";
		
		List<UserDTO> ids = dao.getids();
		
		for (int i = 0; i < ids.size(); i++) {
		    String u_id = ids.get(i).getU_id();
		    if (userid.length() < 5 || userid.length() > 15) {
		        message = "<span style='color:red;font-weight:bold'>5~15자 이내로 작성해야 합니다</span>";
		        return message;
		    }

		    if (userid.equals(u_id)) {
		        message = "<span style='color:red;font-weight:bold'>중복된 아이디 입니다</span>";
		        return message;
		    } else {
		        message = "<span style='color:green;font-weight:bold'>사용가능한 아이디입니다</span>";
		    }
		}
		
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
		
		String userid=req.getParameter("u_id").trim();
		String cnt="0";
		
		List<UserDTO> ids = dao.getids();
	
		for(int i=0; i<ids.size(); i++) {
			String u_id = ids.get(i).getU_id();
			if(userid.equals(u_id)) {
				cnt="1";
			} else {
				cnt="0";
			}
		}
		JSONObject json = new JSONObject();
		json.put("count", cnt);	// key, value
		return json.toString();
	} // idCheckCookieProc() end
	
	@GetMapping("/login")
	public String login() {
		return "/login/loginForm";
	} // login() end
	
	@PostMapping("/loginProc")
	public ModelAndView loginProc(@ModelAttribute UserDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session, String u_id) {

	    ModelAndView mav = new ModelAndView();
	    boolean loginSuccess = false;
	    
	    // String message = "";
	    
	    List<UserDTO> list = dao.loginProc();

	    for (int i=0; i<list.size(); i++) {
	    	String id = list.get(i).getU_id();
			String pw = list.get(i).getU_pw();

	        if (id.equals(dto.getU_id()) && pw.equals(dto.getU_pw())) {
	            loginSuccess = true;
	            break;
	        }
	    }
	    
	    if (loginSuccess) { // 로그인 성공했을때
	        session.setAttribute("s_id", u_id); // 아이디만 저장
	        
	        // 아이디 쿠키 저장
	        String c_id = Utility.checkNull(req.getParameter("c_id"));
			Cookie cookie = null;
			if(c_id.equals("SAVE")){	// ID저장에 체크를 했다면
				// 쿠키 변수 선언 new Cookie("변수명", 값)
				cookie = new Cookie("c_id", dto.getU_id());
				// 쿠키의 생존기간 1개월
				cookie.setMaxAge(60*60*24*30);	// 각 브라우저의 쿠키삭제의 영향을 받음
			} else {
				cookie = new Cookie("c_id","");
				cookie.setMaxAge(0);
			} // if end
			
			// 요청한 사용자 PC에 쿠키값을 저장
			resp.addCookie(cookie);
	        
	        mav.setViewName("redirect:/home");  // 홈으로
	        System.out.println("로그인 성공");
	    } else {
	        // 로그인 실패했을때
	        // mav.addObject("message", "<p>아이디와 비번이 일치하지 않습니다</p>");
	        // mav.addObject("link", "<a href='javascript:history.back()'>[다시시도]</a>");
	        mav.setViewName("redirect:/login");
	        System.out.println("로그인 실패");
	    } // if end

	    return mav;
	} // login() end
	
	@GetMapping("/findLogin")
	public String findLogin() {
		return "/login/findLogin";
	} // findLogin() end
	
	
	@PostMapping("/findLogin")
	public ModelAndView findLogin(@ModelAttribute UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String message = "";
		// System.out.println(dto);
		boolean flag = dao.findLogin(dto);
		if(!flag) {	// 찾기 실패시
			message = "<span style='color:red;font-weight:bold'>아이디와 이메일을 다시 확인해주세요</span>";
			message = "<p><a href='javascript:history.back()'>[다시시도]</a>";
		} else {
			message += "아이디/임시 비밀번호가 이메일로 전송되었습니다\\n";
			message += "임시 비밀번호는 로그인 후 회원정보 수정에서 수정하시기 바랍니다";
		} // if end
		mav.setViewName("/login/findLogin");
		mav.addObject("message", message);
		return mav;
	} // findLogin
	
	
	
	@PostMapping("findID")
	@ResponseBody
	public String findID (HttpServletRequest req) {
	    String username = req.getParameter("username");
	    String useremail = req.getParameter("useremail");
	    //System.out.println(username);
	    //System.out.println(useremail);

	    // findID 메서드 호출
	    String message = dao.findID(username, useremail);

	    return message;
	}
	

	
	
	
	
	// 마이페이지 대표로 이동
	@GetMapping("/mypage")
	public String mypage() {
		return "/login/mypage";
	} // mypage() end
	
	// 나의 정보로 이동
	@GetMapping("/myinfo")
	public String myinfo() {
		return "/login/myinfo";
	} // myinfo() end
	
	// 수강강좌로 이동
	@GetMapping("/mysugang")
	public String mysugang() {
		return "/login/mysugang";
	} // mysugang() end
	
	// 문의내역으로 이동
	@GetMapping("/myqna")
	public String myqna() {
		return "/login/myqna";
	} // mysugang() end
	
	@GetMapping("/mypay")
	public String mypay() {
		return "/login/mypay";
	} // mypay() end
	
} // class end
=======
			mav.setViewName("login/login");
		} // if ends : 회원가입 여부 확인
		
		return mav;
	} // join() ends

	
} // class ends 
>>>>>>> 59114d0c28a67bc88e76599c07e67d66141c0961
