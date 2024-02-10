package kr.spring.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	    	
	    	List<MovieVO> movieList = movieService.selectMovieList();
	    	log.debug("<<영화 목록 반환 >> + " + movieList);
	    	
	    	
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("movieMain");
	    	mav.addObject("list",movieList);
	    	
	        return mav;
	        
	    }
	
	    
	
	  @RequestMapping("/movie/movieDetail") 
	  public ModelAndView process(@RequestParam int movie_num) { 
		  log.debug("<<영화 상세 페이지>> : " + movie_num);
		  
		  MovieVO movie = movieService.selectMovie(movie_num);
		  
		  return new ModelAndView("movieDetail","movie",movie);
	
	  
		
}
}