package kr.spring.reserve.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.member.vo.MemberVO;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.payment.vo.PayVO;
import kr.spring.reserve.dao.ShowMapper;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.service.ShowService;
import kr.spring.reserve.service.TicketService;
import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;
import lombok.extern.slf4j.Slf4j;

@Controller 
@Slf4j
public class TicketController {
	@Autowired
	private ShowService showService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private TicketService ticketService;

	/*====================
	 * 	  상영 정보 등록
	 ====================*/
	//자바빈 초기화
	@ModelAttribute
	public ShowVO initCommand() {
		return new ShowVO();
	}
	
	
	/*====================
	  	  예매 정보 읽어오기
	 ====================*/
	
	  @RequestMapping("/reserve/payConfirm") 
	  public String confirm(Model model,int choice_num, int choice_screen,int choice_time, int choice_people, int choice_price,HttpSession session) {
	  
		ShowVO show = null;
		show = ticketService.selectedShow(choice_time);
			
		ScreenVO screen = null;
		screen = ticketService.selectedScreen(choice_screen);
			
		MovieVO movie = null;
		movie = ticketService.selectedMoive(choice_num);
			
			
		model.addAttribute("movie",movie);
		model.addAttribute("screen",screen);
		model.addAttribute("show",show);
	  
	  return "payConfirm"; }
	 
	
	
	/*====================
	 * 	  좌석 선택
	 ====================*/
	@RequestMapping("/reserve/seatMain")
	public String seat(Model model,int choice_num, int choice_screen,int choice_time, HttpSession session) {
		
		ShowVO show = null;
		show = ticketService.selectedShow(choice_time);
		
		ScreenVO screen = null;
		screen = ticketService.selectedScreen(choice_screen);
		
		MovieVO movie = null;
		movie = ticketService.selectedMoive(choice_num);
		
		model.addAttribute("movie",movie);
		model.addAttribute("screen",screen);
		model.addAttribute("show",show);
		
		return "seatMain";
	}

	/*====================
	 * 	  	  결제
	 ====================*/
	@RequestMapping("reserve/payMain")
	public String pay(Model model,int choice_num, int choice_screen,int choice_time, int choice_people, int choice_price, HttpSession session) {
		
		ShowVO show = null;
		show = ticketService.selectedShow(choice_time);
		
		ScreenVO screen = null;
		screen = ticketService.selectedScreen(choice_screen);
		
		MovieVO movie = null;
		movie = ticketService.selectedMoive(choice_num);
		
		
		model.addAttribute("movie",movie);
		model.addAttribute("screen",screen);
		model.addAttribute("show",show);
		
		return "payMain";
	}
	
	@RequestMapping("member/MypageTicket")
	public String ticket(int choice_num, int choice_screen,int choice_time,Model model,HttpSession session) {
		ShowVO show = null;
		show = ticketService.selectedShow(choice_time);
		
		ScreenVO screen = null;
		screen = ticketService.selectedScreen(choice_screen);
		
		MovieVO movie = null;
		movie = ticketService.selectedMoive(choice_num);
		
		
		model.addAttribute("movie",movie);
		model.addAttribute("screen",screen);
		model.addAttribute("show",show); 
		
		return "MypageTicket";
	}
	
	@PostMapping("reserve/insertPay")
	public String insertPay(TicketVO ticket,Model model, HttpSession session) {
		log.debug("<<티켓 구매>> : " + ticket);
		
		
		ShowVO show = null;
		show = ticketService.selectedShow(ticket.getShw_num());
		
		ScreenVO screen = null;
		screen = ticketService.selectedScreen(ticket.getScr_num());
		
		MovieVO movie = null;
		movie = ticketService.selectedMoive(ticket.getMovie_num());
		
		ticketService.insertTicket(ticket);
		
		/*
		 * TicketVO people = null; people =
		 * ticketService.selectedPPL(ticket.getRes_mem_total());
		 * 
		 * TicketVO price = null; price =
		 * ticketService.selectedPrice(ticket.getRes_pay());
		 */
		 
		
		model.addAttribute("movie",movie);
		model.addAttribute("screen",screen);
		model.addAttribute("show",show);
		
		/*
		 * model.addAttribute("people",people); model.addAttribute("price",price);
		 */
		 
		model.addAttribute("ticketPay", ticket);
		
	 return "payConfirm"; 
	}
}
