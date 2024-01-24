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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.TicketVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	@Autowired
	private MovieService movieService;

	//자바빈 초기화
	@ModelAttribute
	public MovieVO initCommand() {
		return new MovieVO();
	}

	@RequestMapping("/reserve/reserveMain")
	public String process(Model model) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		List<MovieVO> list =null;
		list = movieService.selectList(map);
		log.debug("list : " + list);

		model.addAttribute("list", list);

		return "reserveMain";
	}

	/*====================
	 * 	  예매 영화 목록
	 ====================*/

	@RequestMapping("reserve/list") 
	public ModelAndView process(int movie_num,String movie_title,String movie_poster,int movie_gradeNm) {
		Map<String,Object> map = new HashMap<String,Object>();


		List<MovieVO> list =null;
		list = movieService.selectList(map);
		log.debug("list : " + list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveMain");
		mav.addObject("list",list);



		return mav;
	}



	/*====================
	 * 	  예매 극장 목록
	 ====================*/


	/*====================
	 * 	  예매 시간 목록
	 ====================*/


}
