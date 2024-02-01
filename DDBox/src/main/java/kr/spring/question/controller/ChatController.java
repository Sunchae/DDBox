package kr.spring.question.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.question.service.ChatService;
import kr.spring.question.vo.ChatroomVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private MemberService memberService;
	
	//채팅방 목록
	@RequestMapping("/faq/chat/chatUser")
	public String process() {
		
		return "chatUser";
	}
	
	/*==================================
	 * 채팅방 생성
	 *================================== */
	/*//채팅방 리스트 호출
	@GetMapping("/faq/chat/chatRoomWrite")
	public String insertChatRoom() {
		return "/faq/chat/chatUserRoom";
	}*/

	//채팅방 생성  
	@RequestMapping("/faq/chat/chatRoomWrite")
	public String insertChatRoom(ChatroomVO vo, HttpSession session) {
		log.debug("<<채팅방 생성 ChatRoomVO>> : " + vo);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//유저 지정
		vo.setUser_num(user.getMem_num());
		chatService.insertChatRoom(vo);
		
		return "redirect:/faq/chat/chatUserRoom";
	}
	
	
}
