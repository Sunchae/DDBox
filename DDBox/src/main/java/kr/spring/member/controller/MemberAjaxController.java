package kr.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;
	/*======================================
	 * 		아이디 중복 체크
	 =======================================*/
	@RequestMapping("/member/confirmId")
	@ResponseBody
	public Map<String,String> process(@RequestParam String mem_id){
		log.debug("<<아이디 중복 체크>> : " + mem_id);
		
		Map<String,String> mapAjax = new HashMap<String, String>();
		
		MemberVO member = memberService.selectCheckMember(mem_id);
		if(member != null) {
			//아이디 중복
			mapAjax.put("result", "idDuplicated");
		}else {
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$", mem_id)) {
			//패턴 불일치
			mapAjax.put("result", "notMatchPattern");
			}else {
				//패턴 일치하면서 아이디 미중복
				mapAjax.put("result", "idNotFound");
			}
		}
		return mapAjax;
	}
	
	/*==============================
	 * 프로필 사진 업로드
	 *==============================*/
	@RequestMapping("/member/updateMyPhoto")
	@ResponseBody
	public Map<String,String> processProfile(MemberVO memberVO,
			                                 HttpSession session){
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapAjax.put("result", "logout");
		}else {
			memberVO.setMem_num(user.getMem_num());
			memberService.updateProfile(memberVO);
			
			mapAjax.put("result", "success");
		}
		return mapAjax;
	}
	
	/*==============================
	 * 닉네임 변경
	 *==============================*/
	@PostMapping("/member/changeNickname")
	public void changeNickname(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam("mem_nickname") String nickname) throws IOException {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    
	    try {
	        // 닉네임 변경 로직 구현: 사용자 객체에 새 닉네임 설정
	        user.setMem_nickname(nickname); // 새 닉네임 적용
	        memberService.changeNickname(user); // 서비스 메서드에 전달하여 DB에 저장
	        
	        response.setContentType("text/plain");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("닉네임이 변경되었습니다."); // 성공 메시지 응답
	    } catch (Exception e) {
	        // 에러 처리
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("닉네임 변경에 실패했습니다."); // 실패 메시지 응답
	    }
	}
	
}
























