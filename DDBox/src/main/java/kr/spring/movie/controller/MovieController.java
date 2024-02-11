package kr.spring.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MovieController {
	    @Autowired
	    private MovieService movieService;

	    @GetMapping("/main/main")
	    public ModelAndView getMainMovieList() {
	    	
	    	List<MovieVO> movieList = movieService.selectMainMovieList();
	    	log.debug("<<영화 목록 반환 >> + " + movieList);
	    	
	    	
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("mainpage");
	    	mav.addObject("movieList",movieList);
	    	
	    	return mav;
	    	
	    }
	    
	    @GetMapping("/movie/main")
	    public ModelAndView getMovieList() {
	    	
	    	List<MovieVO> movieList = movieService.selectMovieListWithLikes();
	    	log.debug("<<영화 목록 반환 >> + " + movieList);
	    	
	    	
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("movieMain");
	    	mav.addObject("list",movieList);
	    	
	        return mav;
	        
	    }
	
	    
	
	  @RequestMapping("/movie/movieDetail") 
	  public String movieDetail(@RequestParam("movie_num") int movie_num, Model model) {
		    MovieVO movie = movieService.selectMovie(movie_num);
		    int likesCount = movieService.countLikes(movie_num); // 좋아요 개수 조회
		    model.addAttribute("movie", movie);
		    model.addAttribute("likesCount", likesCount);
		    return "movieDetail";
		}
	  
	  @PostMapping("/movie/checkLikeStatus")
	  @ResponseBody
	  public Map<String, Object> checkLikeStatus(@RequestParam("movie_num") int movie_num, HttpSession session) {
	      Map<String, Object> resultMap = new HashMap<>();
	      MemberVO member = (MemberVO) session.getAttribute("user");
	      if (member == null) {
	          resultMap.put("status", "logout");
	      } else {
	          int isLiked = movieService.checkLike(member.getMem_num(), movie_num);
	          log.debug("<<하트 상태 체크>>" + isLiked);
	          if(isLiked > 0) {
	        	  resultMap.put("status", "liked");
	          }else {
	        	  resultMap.put("status", "notLiked");
	          }
	          
	      }
	      return resultMap;
	  }
	  
	  @PostMapping("/movie/toggleLike")
	  @ResponseBody
	  public Map<String, Object> toggleLike(@RequestParam("movie_num") int movie_num, HttpSession session) {
	      
		  
		  Map<String, Object> resultMap = new HashMap<>();
		 
		  MemberVO member = (MemberVO) session.getAttribute("user");
	      log.debug("<<좋아요 토글 로그인 상태 체크>>" + member);
	      if (member == null) {
	          resultMap.put("status", "logout");
	          resultMap.put("message", "로그인 후 이용할 수 있습니다.");
	          return resultMap;
	      }

	      
	      boolean isLiked = false;
	      int likesCount = 0;
	      
	      // 좋아요 토글 처리를 위한 서비스 호출
	       isLiked = movieService.toggleLike(member.getMem_num(), movie_num);
	       likesCount = movieService.countLikes(movie_num);
	       log.debug("<<isLiked 좋아요 상태>> : " + isLiked);
	       log.debug("<<likesCount 좋아요 개수>> : " + likesCount);
	      resultMap.put("liked", isLiked);
	      resultMap.put("likesCount", likesCount);

	      return resultMap;
	      }
	  
}