package kr.spring.question.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.question.service.RentalService;
import kr.spring.question.vo.RentalVO;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	
	/*==========================
	 * 대관 글등록
	 *==========================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public RentalVO initCommand() {
		return new RentalVO();
	}
	
	//등록폼 호출
	@GetMapping("faq/rental/write")
	public String form() {
		return "rental_write";
	}
	
	//글 등록
	@PostMapping("faq/rental/write")
	public String submit(@Valid RentalVO rentalVO, BindingResult result,
						 HttpSession session, HttpServletRequest request, Model model) {
		log.debug("<<단체/대관 문의 작성>> : " + rentalVO);
		
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호
		MemberVO vo = (MemberVO)session.getAttribute("user");
		rentalVO.setMem_num(vo.getMem_num());
		
		log.debug("<<대관>> rentalVO : " + rentalVO);
		
		//글쓰기
		rentalService.insertRental(rentalVO);
		
		model.addAttribute("message", "예약 신청이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/faq/rental");
		
		return "common/resultAlert";
	}
	
	/*===========================
	 * 글 목록
	 * ==========================*/
	
	@RequestMapping("/faq/rental")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="order",defaultValue="1") int order,
								String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyword", keyword);
		
		//전체,검색 레코드 수
		int count = rentalService.selectRowCount(map);
		log.debug("<<대관 글목록 count>>" + count);
		
		//페이지 처리
		PageUtil page = new PageUtil(null, keyword, currentPage, count, 20, 10, "list");
		
		List<RentalVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = rentalService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rental");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/*==========================
	 * 글상세
	 *==========================*/
	@RequestMapping("/faq/rental/detail")
	public ModelAndView detailProcess(@RequestParam int rental_num) {
		log.debug("<<렌탈 글 상세>> : " + rental_num);
		
		RentalVO rental = rentalService.selectRental(rental_num);
		
		return new ModelAndView("rental_detail", "rental", rental);
	}
	
	
	/*==========================
	 * 글삭제
	 *==========================*/
	@RequestMapping("/faq/rental/delete")
	public String submitDelete(@RequestParam int rental_num, HttpServletRequest request) {
		log.debug("<<렌탈 글 삭제>> : " + rental_num);
		
		rentalService.deleteRental(rental_num);
		
		return "redirect:/faq/rental";
	}
	
	
	/*==========================
	 * 상태 변경
	 *==========================
	@PostMapping("/faq/rental/updateStatus")
	public String execute(@RequestParam int rental_num, 
						  HttpServletRequest request,
						  HttpServletResponse response,
						  HttpSession session){
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		RentalVO rental = rentalService.selectRental(rental_num);
		
		
		
		
		return "";
	}
	*/
	
	
}