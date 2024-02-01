package kr.spring.question.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.question.dao.ChatMapper;
import kr.spring.question.vo.ChatVO;
import kr.spring.question.vo.ChatroomVO;

@Service
@Transactional
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatMapper chatMapper;

	@Override
	public List<ChatroomVO> selectChatRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void insertChatRoom(ChatroomVO chatroomVO) {
		chatMapper.insertChatRoom(chatroomVO);
	}

	@Override
	public List<ChatroomVO> getChattingListForUser(int mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatroomVO> getChattingListForAdmin(int mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReadCountUser(int mem_num, int chatroom_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getReadCountAdmin(int mem_num, int chatroom_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertChat(ChatVO chat) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ChatVO> getChat(int chatroom_num, int mem_num) {
		// TODO Auto-generated method stub
		return null;
	}
}
