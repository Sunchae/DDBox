package kr.spring.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.TicketVO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	//자바빈 초기화
	@ModelAttribute
	public TicketVO initCommand() {
		return new TicketVO();
	}
	
	/*====================
	 * 	  예매 영화 목록
	 ====================*/
	
	
	/*====================
	 * 	  예매 극장 목록
	 ====================*/
	
	
	/*====================
	 * 	  예매 시간 목록
	 ====================*/
	
	
}
