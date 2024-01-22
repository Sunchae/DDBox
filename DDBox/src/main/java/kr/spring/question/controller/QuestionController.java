package kr.spring.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.question.service.QuestionService;
import kr.spring.question.vo.QuestionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
	/*==========================
	 * 메인페이지 
	 *==========================*/
	@RequestMapping("/faq/main")
	public String process() {
		return "faqMain";
	}
	
	
	
	/*==========================
	 * 자주묻는 질문 글 목록
	 *==========================*/
	@RequestMapping("/faq/question")
	public ModelAndView questionpro(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
									String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq_question");
		
		return mav;
	}
	
	/*==========================
	 * 자주묻는 질문 글 등록
	 *==========================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public QuestionVO initCommand() {
		return new QuestionVO();
	}
	
	//등록 폼 호출
	@GetMapping("/faq/question_write")
	public String Questionform() {
		return "question_write";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/*==========================
	 * 공지 뉴스 메뉴 호출
	 *==========================*/
	@RequestMapping("/faq/news")
	public String viewNews() {
		return "news";
	}
	
	
	
	
	
	
	
	
}
