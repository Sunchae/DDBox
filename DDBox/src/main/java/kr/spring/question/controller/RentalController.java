package kr.spring.question.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@RequestMapping("/faq/rental")
	public String form() {
		return "rental";
	}
	
	
}
