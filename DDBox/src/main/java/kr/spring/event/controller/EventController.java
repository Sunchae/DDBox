package kr.spring.event.controller;

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

import kr.spring.event.service.EventService;
import kr.spring.event.vo.Event_listVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EventController {
	@Autowired
	private EventService eventService;
	
	/*========================
	 * 이벤트 글등록
	 *========================*/
	//자바빈(VO)초기화
	@ModelAttribute
	public Event_listVO initCommand() {
		return new Event_listVO();
	}
	//등록 폼 호출
	@GetMapping("/event/write")
	public String form() {
		return "eventWrite";//tiles설정명
	}
	
	//전송된 데이터 처리
	@PostMapping("/event/write")
	public String submit(@Valid Event_listVO event_listVO,BindingResult result,
			 HttpSession session, HttpServletRequest request, Model model) {
		
		//유효성 체크
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호
		MemberVO vo = (MemberVO)session.getAttribute("user");
		event_listVO.setMem_num(vo.getMem_num());
		
		//글쓰기
		eventService.insertEvent(event_listVO);
		
		//view에 표시할 메시지
		model.addAttribute("message", "글 작성이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/event/main");		
		
		return "event/resultAlert";
	}
	
	
	/*========================
	 * 이벤트 main
	 *========================*/
	@RequestMapping("/event/main")
	public String process() {
		return "eventMain";
	}
	/*========================
	 * 이벤트 special
	 *========================*/
	@RequestMapping("/event/special")
	public String specialpro() {
		return "event_special";
	}
	/*========================
	 * 이벤트 entry
	 *========================*/
	@RequestMapping("/event/entry")
	public String entrypro() {
		return "event_entry";
	}
	/*========================
	 * 이벤트 membership
	 *========================*/
	@RequestMapping("/event/membership")
	public String membershippro() {
		return "event_membership";
	}
	/*========================
	 * 이벤트 theater
	 *========================*/
	@RequestMapping("/event/theater")
	public String theaterpro() {
		return "event_theater";
	}
	/*========================
	 * 이벤트 discount
	 *========================*/
	@RequestMapping("/event/discount")
	public String discountpro() {
		return "event_discount";
	}
	/*========================
	 * 이벤트 roulette
	 *========================*/
	@RequestMapping("/event/roulette")
	public String roulettepro() {
		return "event_roulette";
	}
}
