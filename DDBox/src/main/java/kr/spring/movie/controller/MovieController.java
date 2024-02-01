package kr.spring.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MovieController {
	    @Autowired
	    private MovieService movieService;

	    @GetMapping("/movie/list")
	    public List<MovieVO> getMovieList() {
	    	
	    	List<MovieVO> movieList = movieService.selectMovieList();
	    	log.debug("<<영화 목록 반환 >> + " + movieList);
	    	
	        return movieList;
	        
	    }
	
	

	
	  @RequestMapping("/movie/movieDetail") 
	  public String process( ) { 
	  
	
	  
	  return "movieDetail"; 
		
}
}