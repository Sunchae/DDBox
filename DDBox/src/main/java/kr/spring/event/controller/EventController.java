package kr.spring.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.event.service.EventService;
import kr.spring.event.vo.Event_listVO;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EventController {
	@Autowired
	private EventService eventService;
	
	/*========================
	 * 이벤트 글 목록
	 *========================*/
	@RequestMapping("/event/main")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,String keyfield,String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("eventMain");
		
		return mav;
	}
	
}
