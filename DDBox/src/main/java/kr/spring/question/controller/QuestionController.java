package kr.spring.question.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.question.service.QuestionService;
import kr.spring.question.vo.QuestionVO;
import kr.spring.util.PageUtil;
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
	public ModelAndView questionprocess(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
										@RequestParam(value="order",defaultValue="1") int order,
										String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체,검색 레코드 수
		int count = questionService.selectRowCount(map);
		log.debug("<<글목록 count>> : " + count);
		
		//페이지처리
		PageUtil page = new PageUtil(keyfield, keyword, currentPage, count, 20, 10, "list","&order="+order);
		
		List<QuestionVO> list = null;
		
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = questionService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq_question");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
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
	@GetMapping("/faq/write")
	public String form() {
		return "question_write";
	}
	
	//글 등록
	@PostMapping("/faq/write")
	public String submit(@Valid QuestionVO questionVO, BindingResult result,
						 HttpSession session, HttpServletRequest request, Model model) {
		log.debug("<<자주묻는 질문 글 작성 확인>> : " + questionVO);
		
		//유효성 체크 
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호
		MemberVO vo = (MemberVO)session.getAttribute("user");
		questionVO.setMem_num(vo.getMem_num());
		
		//글쓰기
		questionService.insertQuestion(questionVO);
		
		//view에 표시할 메시지
		model.addAttribute("message", "글 작성이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/faq/question");
		
		return "faq/resultAlert";
	}
	
	
	
	
	/*==========================
	 * 게시판 글상세 
	 *==========================*/
	@RequestMapping("/question/detail")
	public ModelAndView process(@RequestParam int board_num) {
		log.debug("<<게시판 글 상세 board_num>> : " + board_num);
		
		//해당 글 조회수 +
		questionService.updateHit(board_num);
		
		QuestionVO question = questionService.selectQuestion(board_num);
		
		
		//제목에 태그 허용x <<--- 왜 StringUtil이 안되지 일단 킵
		
		return new ModelAndView("question_detail", "question", question);//tiles설정명,속성명,속성값
	}
	
	
	
	
	
	/*==========================
	 * 공지 뉴스 메뉴 호출
	 *==========================*/
	@RequestMapping("/faq/news")
	public String viewNews() {
		return "news";
	}
	
	
	
	
	
	
	
	
}
