package kr.spring.reserve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.service.ShowService;
import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import lombok.extern.slf4j.Slf4j;

@Controller 
@Slf4j
public class SeatController {
	@Autowired
	private ShowService showService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ReserveService reserveService;

	/*====================
	 * 	  상영 정보 등록
	 ====================*/
	//자바빈 초기화
	@ModelAttribute
	public ShowVO initCommand() {
		return new ShowVO();
	}
	
	/*====================
	 * 	  예매 정보 읽어오기
	 ====================*/
	
	
	
	/*====================
	 * 	  좌석 선택
	 ====================*/
	@RequestMapping("/reserve/seatMain")
	public String seat(Model model, HttpSession session) {
		
		return "seatMain";
	}

	/*====================
	 * 	  	  결제
	 ====================*/
	@RequestMapping("reserve/payMain")
	public String pay(Model model, HttpSession session) {
		
		return "payMain";
	}
	
}
