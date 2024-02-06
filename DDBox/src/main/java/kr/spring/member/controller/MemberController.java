package kr.spring.member.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.question.service.EmailService;
import kr.spring.question.vo.EmailVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;

	/*==============================
	 * 자바빈(VO) 초기화
	 *==============================*/
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	/*==============================
	 * 회원가입
	 *==============================*/
	//회원가입여부 체크
	@GetMapping("/member/registerUserCheck")
	public String formCheck() {
		return "memberRegisterCheck";
	}
	//전송된 회원 데이터 처리
	@PostMapping("/member/registerUserCheck")
	public String submitCheck(@Valid MemberVO memberVO,
			BindingResult result,
			Model model,
			HttpServletRequest request) {
		log.debug("<<회원가입 여부>> : " + memberVO);

		String month = Integer.parseInt(memberVO.getMem_birth_month()) < 10 ? "0"+memberVO.getMem_birth_month() : memberVO.getMem_birth_month() ;
		String day = Integer.parseInt(memberVO.getMem_birth_day()) < 10 ? "0"+memberVO.getMem_birth_day() : memberVO.getMem_birth_day() ;

		memberVO.setMem_birth(memberVO.getMem_birth_year()+"-"+month+"-"+day);

		// 디버깅 메시지 추가
		log.debug("<<mem_birth>> : " + memberVO.getMem_birth());

		// 유효성 체크 결과 오류 있으면 폼 호출
		if(result.hasFieldErrors("mem_name") || result.hasFieldErrors("mem_birth") || result.hasFieldErrors("mem_phone")) {
			List<FieldError> list =  result.getFieldErrors();
			for(FieldError error : list) {
				log.debug("<<에러 필드>> : " + error.getField());
			}
			return formCheck();
		}
		// 회원가입 여부  
		if (memberService.selectCheckMemberRegistered(memberVO) >= 1) {
			// 회원 DB에 이미 가입한 전적이 있는 회원(신규가입 불가한 회원)
			model.addAttribute("accessTitle","회원 가입 불가");
			model.addAttribute("accessMsg","이미 가입한 회원입니다.");
			model.addAttribute("accessUrl",request.getContextPath()+"/member/login");
			return "common/resultView";
		}
		//회원 가입 이력 없는 사람이면 다음 절차로 통과
		// 타일스 설정명
		return "memberRegister";
	}


	//회원가입 폼 호출
	@GetMapping("/member/registerUser")
	public String form() {
		return "memberRegister";
	}
	//전송된 회원 데이터 처리
	@PostMapping("/member/registerUser")
	public String submit(@Valid MemberVO memberVO,BindingResult result,Model model,HttpServletRequest request) {
		log.debug("<<회원가입>> : " + memberVO);

		//유효성 체크 결과 오류 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//한자리수 월이나 일 앞에 0 붙여줘서 yyyy-mm-dd 형식 맞추기 위한 부분
		String month = Integer.parseInt(memberVO.getMem_birth_month()) < 10 ? "0"+memberVO.getMem_birth_month() : memberVO.getMem_birth_month() ;
		String day = Integer.parseInt(memberVO.getMem_birth_day()) < 10 ? "0"+memberVO.getMem_birth_day() : memberVO.getMem_birth_day() ;

		memberVO.setMem_birth(memberVO.getMem_birth_year()+"-"+month+"-"+day);


		//나이 계산
		LocalDate birthDate = LocalDate.parse(memberVO.getMem_birth());

		System.out.println("----------------------");
		System.out.println(birthDate);

		LocalDate currentDate = LocalDate.now();

		System.out.println("----------------------");
		System.out.println(currentDate);

		long age = ChronoUnit.YEARS.between(birthDate, currentDate);

		System.out.println("----------------------");
		System.out.println(age);
		//연령대 계산
		String ageGroup = calculateAgeGroup(age);

		System.out.println("----------------------");
		System.out.println(ageGroup);

		//연령대 MemberVO에 저장
		memberVO.setMem_age(ageGroup);

		// 디버깅 메시지 추가
		log.debug("<<mem_birth>> : " + memberVO.getMem_birth());


		/* if(result.hasFieldErrors("mem_name") || result.hasFieldErrors("mem_birth_year")|| result.hasFieldErrors("mem_birth_month") || result.hasFieldErrors("mem_birth_day")
		  		|| result.hasFieldErrors("mem_phone") 
	    		|| result.hasFieldErrors("mem_zipcode") || result.hasFieldErrors("mem_address1") 
	    		|| result.hasFieldErrors("mem_address2") || result.hasFieldErrors("mem_email") 
	    		|| result.hasFieldErrors("mem_gender") || result.hasFieldErrors("mem_pw")) {
	    	List<FieldError> list =  result.getFieldErrors();
	    	for(FieldError error : list) {
	    		log.debug("<<에러 필드>> : " + error.getField());
	    	}
	        return form();
	    }
		 */
		log.debug("생년월일에 의한 연령대 계산 : " + ageGroup);

		//회원가입
		memberService.insertMember(memberVO);

		model.addAttribute("accessTitle","회원가입");
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");
		model.addAttribute("accessUrl",request.getContextPath()+"/main/main");
		return "common/resultView";
		
	}

	public String calculateAgeGroup(long age) {
		String ageGroup = "";

		if(age >= 10 && age < 20) {
			ageGroup = "10대";
		}else if(age >= 20 && age < 30) {
			ageGroup = "20대";
		}else if(age >= 30 && age < 40) {
			ageGroup = "30대";
		}else if(age >= 40 && age < 50) {
			ageGroup = "40대";
		}else if(age >= 50) {
			ageGroup = "50대 이상";
		}else {
			ageGroup = "어린이";
		}

		return ageGroup;

	}





	/*==============================
	 * 회원로그인
	 *==============================*/	
	//로그인 폼 호출
	@GetMapping("/member/login")
	public String formLogin() {
		return "memberLogin";
	}
	//전송된 데이터 처리
	@PostMapping("/member/login")
	public String submit(@Valid MemberVO memberVO,
			BindingResult result,
			HttpSession session,
			HttpServletResponse response) {

		log.debug("<<회원로그인>> : " + memberVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		//id와 pw 필드만 유효성 체크
		if(result.hasFieldErrors("mem_id") || result.hasFieldErrors("mem_pw")) {
			return formLogin();
		}

		//로그인 체크 (id,비밀번호 일치 여부 체크)
		MemberVO member = null;
		try{
			member = memberService.selectCheckMember(memberVO.getMem_id());
			boolean check = false;

			if(member!=null) {
				//비밀번호 일치 여부 체크
				check = member.isCheckedPassword(memberVO.getMem_pw());
			}
			if(check) {//인증 성공
				//자동 로그인 체크 시작
				boolean autoLogin = memberVO.getAuto() != null && memberVO.getAuto().equals("on");

				if(autoLogin) {
					//자동로그인 체크를 한 경우
					String autoid = member.getMem_autoid();
					if(autoid==null) {
						//자동 로그인 체크 식별값 생성
						autoid = UUID.randomUUID().toString();
						log.debug("<<autoid>> : " + autoid);
						member.setMem_autoid(autoid);
						memberService.updateAutoid(member.getMem_autoid(), member.getMem_num());

					}

					Cookie auto_cookie = new Cookie("autoid-log",autoid);
					auto_cookie.setMaxAge(60*60*24*7);//쿠키의 유효기간은 1주일
					auto_cookie.setPath("/");

					response.addCookie(auto_cookie);



				}
				//자동로그인 체크 끝

				//인증 성공, 로그인 처리
				session.setAttribute("user", member);
				log.debug("<<인증 성공>>");
				log.debug("<<mem_id>> : " + member.getMem_id());
				log.debug("<<mem_num>> : " + member.getMem_num());
				log.debug("<<mem_auth>> : " + member.getMem_auth());
				log.debug("<<mem_autoid>> : " + member.getMem_autoid());

				if(member.getMem_auth()==9) {//관리자는 관리자 메인으로 이동
					return "redirect:/member/AdminPageMain";
				}else {//일반 사용자는 사용자 메인으로 이동
					return "redirect:/main/main";
				}
			}
			//인증 실패
			throw new AuthCheckException();

		}catch(AuthCheckException e) {
			log.debug("<<인증 실패>>");
			//인증 실패로 로그인 폼 호출
			if(member!=null && member.getMem_auth()==2) {//정지회원 메시지 표시
				result.reject("noAuthority");
			}else {
				result.reject("invalidIdOrPassword");
			}


			return formLogin();
		}
	}
	/*==============================
	 * 로그아웃
	 *==============================*/
	@RequestMapping("/member/logout")
	public String processLogout(HttpSession session, 
			HttpServletResponse response) {
		//로그아웃
		session.invalidate();
		//자동로그인 처리 시작
		//클라이언트 쿠키 처리
		Cookie auto_cookie = new Cookie("autoid-log","");
		auto_cookie.setMaxAge(0);//쿠키 삭제
		auto_cookie.setPath("/");

		//자동로그인 처리 끝
		response.addCookie(auto_cookie);
		return "redirect:/main/main";
	}
	
	

	/*==============================
	 * 	회원 탈퇴
	 *==============================*/
	
	  // 회원 탈퇴 폼 호출
	  @GetMapping("/member/withdraw") 
	  public String withdrawForm() { 
		  return "withdrawForm"; 
	  }
	  
	  // 회원 탈퇴 처리
	  @PostMapping("/member/withdraw")
	  public String withdraw(HttpSession session){
		  
		  MemberVO member = (MemberVO)session.getAttribute("user");
	  
		  if(member != null) { //로그인 되어 있는 상태 
			  int mem_num = member.getMem_num(); 
			  
			  //회원 탈퇴 처리
			  memberService.withdrawMember(mem_num);
			  
			  //세션에서 사용자 정보 삭제 
			  session.removeAttribute("user");
			  
			  //세션 무효화
			  session.invalidate();
			  
			  return "redirect:/main/main";
			  
		  }else{ //로그인 되지 않은 상태 
				  
			  return "redirect:/member/login"; 
		  }
	  
	  }	  
	  




	/*==============================
	 * 마이페이지
	 *==============================*/
	@RequestMapping("/member/myPage")
	public String process(HttpSession session, Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		log.debug("<<mem_num>> : " + user.getMem_num());

		//회원정보
		MemberVO member = memberService.selectMember(user.getMem_num());

		log.debug("<<회원 상세 정보>> : " + member);

		model.addAttribute("member",member);

		return "myPage";
	}

	/*==============================
	 * 	프로필 사진 출력
	 *==============================*/
	//프로필 사진 출력
	@RequestMapping("/member/photoView")
	public String getProfile(HttpSession session,HttpServletRequest request,Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");

		log.debug("<<프로실 사진 읽기>> : " + user);
		if(user==null) {//로그인 되지 않은 경우
			getBasicProfileImage(request,model);
		}else {//로그인 된 경우
			MemberVO memberVO = memberService.selectMember(user.getMem_num());
			viewProfile(memberVO,request,model);
		}
		return "imageView";

	}
	//프로필 사진 출력(회원번호 지정)
	@RequestMapping("/member/viewProfile")
	public String getProfileByMem_num(@RequestParam int mem_num,HttpServletRequest request,Model model) {
		MemberVO memberVO = memberService.selectMember(mem_num);

		viewProfile(memberVO,request,model);

		return "imageView";
	}
	//프로필 사진 처리를 위한 공통 코드
	public void viewProfile(MemberVO memberVO,HttpServletRequest request,Model model) {
		if(memberVO==null || memberVO.getMem_photoname()==null) {
			//업로드한 프로필 사진 정보가 없어서 기본 이미지 표시
			getBasicProfileImage(request,model);

		}else {//업로드한 아미지 읽기
			model.addAttribute("imageFile",memberVO.getMem_photo());
			model.addAttribute("filename",memberVO.getMem_photoname());
		}
	}
	//기본 이미지 읽기
	public void getBasicProfileImage(HttpServletRequest request, Model model) {
		byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));

		model.addAttribute("imageFile",readbyte);
		model.addAttribute("filename","face.png");
	}








	@RequestMapping("/member/myPageTicket")
	public String process1() {


		return "myPageTicket";
	}
	@RequestMapping("/member/myPageCoupon")
	public String process2() {


		return "myPageCoupon";
	}
	@RequestMapping("/member/myPagePoint")
	public String process3() {


		return "myPagePoint";
	}
	@RequestMapping("/member/myPageEvent")
	public String process4() {


		return "myPageEvent";
	}

	@RequestMapping("/member/myPageGiftshop")
	public String process5() {


		return "myPageGiftshop";
	}
	@RequestMapping("/member/myPageInfo")
	public String process6() {


		return "myPageInfo";
	}
	@RequestMapping("/member/myPageProfile")
	public String process7() {


		return "myPageProfile";
	}

	//문의내역
	@RequestMapping("/member/myPageFAQ")
	public String process8() {


		return "myPageFAQ";
	}

	@RequestMapping("/member/myPageEmail")
	public String process9() {


		return "myPageFAQ";
	}
	@RequestMapping("/member/myPageRental")
	public String process10() {


		return "myPageRental";
	}
}



















