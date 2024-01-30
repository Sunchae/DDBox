package kr.spring.store.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;
import kr.spring.util.FileUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {
	@Autowired
	private StoreService storeService;

	/*=================================
	 *	스토어 메인 글 목록 
	 *=================================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public StoreVO initCommand() {
		return new StoreVO();
	}
	
	@RequestMapping("/store/storeMain")
	public String storeMain(HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<StoreVO> list = null;
		list = storeService.selectList(map);
		
		
		model.addAttribute("list", list);
		
		return "storeMain";
	}
	
	/*=================================
	 *	스토어 글 등록
	 *=================================*/
	//등록 폼 호출
	@GetMapping("/store/write")
	public String form() {

		return "storeWrite";	//타일스 설정명
	}
	@PostMapping("/store/write")
	public String submit(@Valid StoreVO storeVO, BindingResult result,HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException {
		log.debug("<<스토어 글 저장>> : " + storeVO);

		//유효성 체크
		if(result.hasErrors()) {
			return form();
		}

		//회원 번호 세팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		storeVO.setMem_num(vo.getMem_num());
		//ip세팅
		storeVO.setStore_ip(request.getRemoteAddr());
		//파일 업로드
		storeVO.setStore_photo(FileUtil.createFile(request, storeVO.getUpload()));
		//글쓰기
		storeService.insertStore(storeVO);

		//뷰에 표시할 메세지
		model.addAttribute("message", "상품등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/store/storeMain");

		return "common/resultAlert";
	}

	
	/*=================================
	 *	스토어 글 상세
	 *=================================*/
	@RequestMapping("/store/detail")
	public ModelAndView detail(@RequestParam int store_num) {
		log.debug("<<스토어 게시글 상세 store_num>> : " + store_num);
		
		StoreVO store = storeService.selectStore(store_num);
		
		//제목,상품이름에 태그를 허용하지 않음
		store.setStore_title(StringUtil.useNoHtml(store.getStore_title()));
		store.setStore_name(StringUtil.useNoHtml(store.getStore_name()));
		
		return new ModelAndView("storeDetail","store",store);
	}

	
	/*=================================
	 *	스토어 티켓 글 목록 
	 *=================================*/
	@RequestMapping("/store/ticketlist")
	public String ticket(@RequestParam(value="pagenum",defaultValue="1") int currentPage, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<StoreVO> list = null;
		list = storeService.selectList(map);
		log.debug("<<스토어 티켓 글 목록 list>> : " + list);
		
		model.addAttribute("list", list);
		
		return "storeTicketList";
	}
	
	/*=================================
	 *	스토어 메뉴 목록
	 *=================================*/
	@RequestMapping("/store/popcorn")
	public String popcorn(@RequestParam(value="pagenum",defaultValue="1") int currentPage, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<StoreVO> list = null;
		list = storeService.selectList(map);
		log.debug("<<스토어 티켓 글 목록 list>> : " + list);
		
		model.addAttribute("list", list);
		
		return "storePopcorn";
	}
}
