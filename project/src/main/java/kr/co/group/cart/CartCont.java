package kr.co.group.cart;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.group.admin.AdminDAO;
import kr.co.group.admin.AdminDTO;
import kr.co.group.notice.NoticeDTO;

@RequestMapping("cart")
@Controller
public class CartCont {
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	} // 생성자 ends
	
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private CartDAO cdao;
	
	@GetMapping("/list")
	public ModelAndView list(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/list");
		
		// 페이징 
		List<AdminDTO> alist = adao.paging("cartlist");
		// System.out.println(alist);
		AdminDTO adto = alist.get(0);
		
		int numPerPage = adto.getNumPerPage(); // 한 페이지당 행 개수
		int pagePerBlock = adto.getPagePerBlock(); // 페이지 리스트 당 페이지 개수
		
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("pagePerBlock", pagePerBlock);
		
		int totalRowCount = cdao.totalRowCount(); // 전체 글 개수
		// System.out.println(totalRowCount); // 전체 글 개수 확인
		
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
		
		List<CartDTO> list=null;
		  if(totalRowCount>0){
		        list = cdao.list(startRow, endRow);  
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
	}
	
} // class ends 
