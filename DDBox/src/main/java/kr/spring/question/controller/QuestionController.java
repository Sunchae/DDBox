package kr.spring.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.question.service.QuestionService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
	/*==========================
	 * 자주 묻는 질문 목록
	 *==========================*/
	@RequestMapping("/faq/list")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faqList");
		
		return mav;
	}
}
