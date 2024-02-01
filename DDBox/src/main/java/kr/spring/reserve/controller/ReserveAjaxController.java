package kr.spring.reserve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.service.ShowService;
import kr.spring.reserve.vo.ShowVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReserveAjaxController {
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ShowService showService;
	
	 
	/*=============================
	 * 		영화 좋아요 등록/삭제
	 ============================*/
	@RequestMapping("/reserve/getMovie")
	@ResponseBody
	public Map<String,Object> getMovie(@RequestParam int movie_num, MovieVO movie, ShowVO show,HttpSession session){
		log.debug("<<영화 등록/삭제>> : "+ movie);

		Map<String,Object> mapJson = new HashMap<String, Object>();

		MovieVO movieVO = movieService.selectMovie(movie.getMovie_num());
		
		List<ScreenVO> showVO = showService.selectShowListForRev(movie_num);

		if(movieVO != null) {
			mapJson.put("status", "yesMovie");
		}else {
			mapJson.put("status", "noMovie");
		}
		mapJson.put("movieVO", movieVO);
		mapJson.put("showVO", showVO);
		mapJson.put("result", "success");
		

		return mapJson;
	}
	
}
