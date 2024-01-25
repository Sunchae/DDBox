package kr.spring.question.controller;

import java.io.IOException;
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
import kr.spring.question.service.EmailService;
import kr.spring.question.vo.EmailVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmailController {
	@Autowired
	private EmailService emailService;
	
	/*===========================
	 * 문의게시판 글 목록
	 * ==========================*/
	@RequestMapping("/faq/email")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="order",defaultValue="1") int order,
								String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyword", keyword);
		
		//전체,검색 레코드 수
		int count = emailService.selectRowCount(map);
		log.debug("<<글목록 count>> : " + count);
		
		//페이지처리
		PageUtil page = new PageUtil(null, keyword, currentPage, count, 20, 10, "list");
		
		List<EmailVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = emailService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
		}
	
	
	/*==========================
	 * 이메일 문의 글 목록
	 *==========================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public EmailVO initCommand() {
		return new EmailVO();
	}
	
	//등록 폼 호출
	@GetMapping("/faq/email/write")
	public String form() {
		return "email_write";
	}
	
	//글 등록
	@PostMapping("/faq/email/write")
	public String submit(@Valid EmailVO emailVO, BindingResult result,
						 HttpSession session, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		log.debug("<<이메일 문의 작성>> : " + emailVO);
		
		//유효성 체크 
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호
		MemberVO vo = (MemberVO)session.getAttribute("user");
		emailVO.setMem_num(vo.getMem_num());
		
		//파일업로드
		emailVO.setQuestion_file(FileUtil.createFile(request, emailVO.getUpload()));
		//글쓰기
		emailService.insertEmail(emailVO);
		
		//view에 표시할 메시지
		model.addAttribute("message", "문의 작성이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+"/faq/email");
		
		return "common/resultAlert";
	}

	
	
	/*==========================
	 * 이메일 문의 글 등록
	 *==========================*/
	
	
	
	/*==========================
	 * 글상세
	 *==========================*/
	
	
	
	/*==========================
	 * 글수정
	 *==========================*/
	
	
	
	
	/*==========================
	 * 글삭제
	 *==========================*/
	
	
	
}
