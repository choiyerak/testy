package kr.co.group.admin;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.group.user.UserDAO;
import kr.co.group.user.UserDTO;

@RequestMapping("/admin")
@Controller
public class AdminCont {
	public AdminCont() {
		System.out.println("-----AdminCont() 객체 생성됨");
	} // 생성자 ends 
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private AdminDAO adao;
	
	// 회원 목록 
	@GetMapping("userlist")
	public ModelAndView list(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/userList");
		
		String user_col = "";
		if(user_col != null) {
			user_col = user_col.trim();
			user_col = req.getParameter("user_col");
		}
		
		String user_word = "";
		if(user_word != null) {
			user_word = user_word.trim();
			user_word = req.getParameter("user_word");
		}
		
		List<AdminDTO> alist = adao.paging("userlist");
		System.out.println(alist);
		AdminDTO adto = alist.get(0);
		
		// 페이징
		int totalRowCount = dao.totalRowCount(user_col, user_word); // 전체 글 개수
		int numPerPage = adto.getNumPerPage(); // 한 페이지당 행 개수
		int pagePerBlock = adto.getPagePerBlock(); // 페이지 리스트 당 페이지 개수 
		
		
		// page : 현재 페이지 번호, 전달된 값이 없으면 무조건 1
		String page = req.getParameter("page");
		if(page == null) {
			page = "1";
		}
		
		int currentPage=Integer.parseInt(page); // 현재 페이지 
		int startRow   =(currentPage-1)*numPerPage; // 해당 페이지의 첫번째 목록
		int endRow     =currentPage*numPerPage-1;       // 해당 페이지의 마지막 목록 
		  
		// 페이지 수
		double totcnt = (double)totalRowCount/numPerPage;  
		int totalPage = (int)Math.ceil(totcnt); // 총 페이지 수
		double d_page = (double)currentPage/pagePerBlock;
		int Pages     = (int)Math.ceil(d_page) - 1;
		int startPage = Pages*pagePerBlock; // 현재 화면의 첫 페이지 
		int endPage   = startPage+pagePerBlock+1; // 현재 화면의 마지막 페이지 
		
		List<UserDTO> list=null;
		  if(totalRowCount>0){
		        list=dao.list(startRow, endRow, user_col, user_word);  
		  } else { // 글이 없는 경우
		        list=Collections.EMPTY_LIST; // 빈 값을 넣어줌 
		  }//if end 글 존재 여부 확인 
		  
		  mav.addObject("page",   currentPage);
		  mav.addObject("numPerPage", numPerPage);
		  mav.addObject("pagePerBlock", pagePerBlock);
		  mav.addObject("count",     totalRowCount);
		  mav.addObject("totalPage", totalPage);
		  mav.addObject("startPage", startPage);
		  mav.addObject("endPage",   endPage);
		  mav.addObject("list", list);
		
		return mav;
	} // list()
	
	// numPerPage, pagePerBlock 불러오기
	@PostMapping("userlist/admin")
	public String admin(HttpServletRequest req) {
		
		String tname = req.getParameter("tname");
		int numPerPage = Integer.parseInt(req.getParameter("numPerPage"));
		int pagePerBlock = Integer.parseInt(req.getParameter("pagePerBlock"));
		
		AdminDTO dto = new AdminDTO();
		dto.setTname(tname);
		dto.setNumPerPage(numPerPage);
		dto.setPagePerBlock(pagePerBlock);
		
		adao.updatePage(dto);
		
		return "redirect:/admin/userlist";
	} // admin() ends 
	 
	
} // AdminCont class ends 
