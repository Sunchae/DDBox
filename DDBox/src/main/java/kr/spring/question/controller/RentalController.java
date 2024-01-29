package kr.spring.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.question.service.RentalService;
import kr.spring.question.vo.RentalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	
	@RequestMapping("/faq/rental")
	public String form() {
		return "rental";
	}
	
	//자바빈 초기화
	@ModelAttribute
	public RentalVO initCommand() {
		return new RentalVO();
	}
	
	//등록폼 호출
	@GetMapping("faq/rental/write")
	public String wform() {
		return "rental_write";
	}
	
	
}
