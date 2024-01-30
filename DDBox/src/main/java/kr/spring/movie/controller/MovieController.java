package kr.spring.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MovieController {

	

	
	  @RequestMapping("/movie/movieDetail") 
	  public String process( ) { 
	  
	
	  
	  return "movieDetail"; 
		
}
}