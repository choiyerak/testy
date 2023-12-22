package kr.co.group.dump;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.group.user.UserDAO;
import kr.co.group.user.UserDTO;

@RequestMapping("admin_v1")
@Controller
public class AdminCont_v1 {
	public AdminCont_v1() {
		System.out.println("-----AdminCont() 객체 생성됨");
	} // 생성자 ends 
	
	@Autowired
	private UserDAO dao;
	
	// 회원 목록 
	@GetMapping("/userlist")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/userList");
		
		List<UserDTO> list = dao.list();
		int totalRowCount = dao.totalRowCount();
		
		mav.addObject("list", list);
		mav.addObject("count", totalRowCount);
		
		return mav;
	} // list()
} // AdminCont class ends 
