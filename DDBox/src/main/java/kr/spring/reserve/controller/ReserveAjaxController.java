package kr.spring.reserve.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.vo.MemberVO;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.service.ReserveService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReserveAjaxController {
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MovieService movieservice;
	
	
	/*=============================
	 * 		영화 좋아요 등록/삭제
	 ============================*/
	@RequestMapping("/reserve/getMovie")
	@ResponseBody
	public Map<String,Object> getMovie(MovieVO movie){
		log.debug("<<영화 등록/삭제>> : "+ movie);
		
		Map<String,Object> mapJson = new HashMap<String, Object>();
		
		MovieVO movieVO = movieservice.selectMovie(movie.getMovie_num());
		
		if(movieVO != null) {
			mapJson.put("status", "yesMovie");
		}else {
			mapJson.put("status", "noMovie");
		}
		mapJson.put("rseult", "success");
		
		return mapJson;
	}
	
	
}
