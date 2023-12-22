package kr.co.group.notice;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.group.admin.AdminDAO;
import kr.co.group.admin.AdminDTO;
import kr.co.group.inquiry.InquiryDTO;

@RequestMapping("notice")
@Controller
public class NoticeCont {
	
	@Autowired
	private AdminDAO adao; 
	
	@Autowired
	private NoticeDAO ndao;
	
	public NoticeCont() {
		System.out.println("-----NoticeCont() 객체 생성함");
	} // 생성자 ends 
	
	// 공지사항 목록
	@GetMapping("/home")
	public ModelAndView home(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/home");
		
		// 검색 타입 
		String col = "";
		if(col != null) {
			col = col.trim();
			col = req.getParameter("col");
		} // if ends : 검색 타입 null 여부 확인 
		
		// 검색어 
		String word = "";
		if(word != null) {
			word = word.trim();
			word = req.getParameter("word");
		} // if ends 검색어 null 여부 확인
		
		// 페이징 
		List<AdminDTO> alist = adao.paging("noticelist");
		System.out.println(alist);
		AdminDTO adto = alist.get(0);
		
		int numPerPage = adto.getNumPerPage(); // 한 페이지당 행 개수
		int pagePerBlock = adto.getPagePerBlock(); // 페이지 리스트 당 페이지 개수
		
		int totalRowCount = ndao.totalRowCount(col, word); // 전체 글 개수
		System.out.println(totalRowCount); // 전체 글 개수 확인
		
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
		
		List<NoticeDTO> list=null;
		  if(totalRowCount>0){
		        list = ndao.list(startRow, endRow, col, word);  
		  } else { // 글이 없는 경우
		        list=Collections.EMPTY_LIST; // 빈 값을 넣어줌 
		  }//if end 글 존재 여부 확인
		
		
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("pagePerBlock", pagePerBlock);
		mav.addObject("page",   currentPage);
		mav.addObject("count", totalRowCount);
		mav.addObject("totalPage", totalPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage",   endPage);
		mav.addObject("list", list);
		
		return mav;
	} // home() ends 
	
	// 문의 사항 글쓰기으로 이동
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	} // write() ends
	
	// numPerPage, pagePerBlock 불러오기
	@PostMapping("home/admin")
	public String admin(HttpServletRequest req) {
		
		String tname = req.getParameter("tname");
		int numPerPage = Integer.parseInt(req.getParameter("numPerPage"));
		int pagePerBlock = Integer.parseInt(req.getParameter("pagePerBlock"));
		
		AdminDTO adto = new AdminDTO();
		adto.setTname(tname);
		adto.setNumPerPage(numPerPage);
		adto.setPagePerBlock(pagePerBlock);
		
		adao.updatePage(adto);
		
		return "redirect:/notice/home";
	} // admin() ends
} // class ends 
