package kr.spring.store.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.store.service.StoreService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/store/main")
	public String process() {
		
		return "storeMain";
	}
	
	/*=================================
	 *	스토어 티켓 글 목록 
	 *=================================*/
	@RequestMapping("/store/storeTicketList")
	public String ticketList(@RequestParam(value="pagenum",defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		return "storeTicketList";
	}
	
}
