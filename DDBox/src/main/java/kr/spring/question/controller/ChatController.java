package kr.spring.question.controller;

import java.util.List;

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
	//채팅방 생성  
	@GetMapping("/faq/chat/chattingListForUser")
	public String insertChatRoom(HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		log.debug("<<MemberVO>> : " + user);
		ChatroomVO vo = chatService.checkChatRoom(user.getMem_num());
		log.debug("<<catroom_num>>");
		int chatroom_num=0;
		if(vo == null) {
			ChatroomVO ChatroomVO = new ChatroomVO();
			ChatroomVO.setUser_num(user.getMem_num());
			ChatroomVO.setAdmin_num(2);
			ChatroomVO chatroom = chatService.insertChatRoom(ChatroomVO);
			chatroom_num = chatroom.getChatroom_num();
		}else {
			chatroom_num = vo.getChatroom_num();
		}
		return "redirect:/faq/chat/chatUserRoom_detail?chatroom_num="+chatroom_num;
	
	}
	
	
	
	/*==================================
	 * 채팅 생성
	 *================================== */
	
	
	
	
	
}
