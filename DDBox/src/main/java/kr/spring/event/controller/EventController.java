package kr.spring.event.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.event.service.EventService;
import kr.spring.event.vo.Entry_listVO;
import kr.spring.event.vo.Event_listVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
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
			 HttpSession session, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		log.debug("<<게시판 글 저장>> : " + event_listVO);
		//유효성 체크
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호
		MemberVO vo = (MemberVO)session.getAttribute("user");
		event_listVO.setMem_num(vo.getMem_num());
		
		event_listVO.setEvent_photo1(FileUtil.createFile(request, event_listVO.getUpload1()));
		event_listVO.setEvent_photo2(FileUtil.createFile(request, event_listVO.getUpload2()));
		
		//글쓰기
		eventService.insertEvent(event_listVO);
		
		//view에 표시할 메시지
		model.addAttribute("message", "글 작성이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/event/main");		
		
		return "event/resultAlert";
	}
	
	/*========================
	 * 이벤트 글상세
	 *========================*/
	@RequestMapping("/event/detail")
	public ModelAndView process(@RequestParam int event_num) {
		log.debug("<<게시판 글 상세 event_num>> : " + event_num);
		
		Event_listVO event_list = eventService.selectEvent(event_num);
		
		//제목에 태그를 허용하지 않음
		event_list.setEvent_title(StringUtil.useNoHtml(event_list.getEvent_title()));
								//타일스 설정명,속성명	,속성값
		return new ModelAndView("eventView","event_list",event_list);
	}
	
	/*========================
	 * 이벤트 main
	 *========================*/
	@RequestMapping("/event/main")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("eventMain");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 special
	 *========================*/
	@RequestMapping("/event/special")
	public ModelAndView specialpro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event_special");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 entry
	 *========================*/
	@RequestMapping("/event/entry")
	public ModelAndView entrypro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event_entry");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 membership
	 *========================*/
	@RequestMapping("/event/membership")
	public ModelAndView membershippro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event_membership");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 theater
	 *========================*/
	@RequestMapping("/event/theater")
	public ModelAndView theaterpro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event_theater");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 discount
	 *========================*/
	@RequestMapping("/event/discount")
	public ModelAndView discountpro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,@RequestParam(value="order",defaultValue="1") int order ,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체 /검색 레코드수
		int count = eventService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
		
		List<Event_listVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = eventService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event_discount");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	/*========================
	 * 이벤트 roulette
	 *========================*/
	//roulette 폼 호출
	@GetMapping("/event/roulette")
	public String rouletteform() {
		return "event_roulette";//tiles설정명
	}
	@PostMapping("/event/rouletteAjax")//ajax통신따로 만들어줌
	@ResponseBody
	public Map<String,String> roulettepro(@Valid Entry_listVO entry_listVO,HttpSession session) {
		Map<String,String> mapJson = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			//로그인 안됨
			mapJson.put("result", "logout");
		}else {
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
	
	/*========================
	 * roulette 참여자 리스트 등록
	 *========================*/
	//insert부분 수정
	@PostMapping("/event/rouletteinsertAjax")//ajax통신따로 만들어줌
	@ResponseBody
	public Map<String,Object> rouletteinsert(Entry_listVO entry_listVO,HttpSession session) {
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			//로그인이 안됨
			mapJson.put("result", "logout");
		}else {
			entry_listVO.setEvent_type(0);
			eventService.insertEntry(entry_listVO);
			mapJson.put("result", "success");
		}
		
		return mapJson;
	}
}
