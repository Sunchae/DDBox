package kr.spring.question.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.question.vo.ChatVO;
import kr.spring.question.vo.ChatroomVO;

@Mapper
public interface ChatMapper {
	//채팅방 목록
	public List<ChatroomVO> selectChatRoomList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);

	//채팅방 유무 체크
	@Select("SELECT * FROM faq_chatroom WHERE user_num=#{user_num}")
	public ChatroomVO checkChatRoom(int user_num);
	//채팅방 생성
	public void insertChatRoom(ChatroomVO chatroomVO);
	
	
	//회원 채팅방 입장
	@Select("SELECT * FROM member JOIN faq_chatroom ON mem_num=#{user_num} WHERE chatroom_num=#{chatroom_num}")
	public List<ChatroomVO> getChattingListForUser(int mem_num);
	//관리자 채팅방 입장
	public List<ChatroomVO> getChattingListForAdmin(int mem_num);
	//회원 read count 개수
	public int getReadCountUser(int mem_num, int chatroom_num);
	//관리자 read count 개수
	public int getReadCountAdmin(int mem_num, int chatroom_num);
	//채팅 내용 입력
	public void insertChat(ChatVO chat);
	//채팅 내용 불러오기
	public List<ChatVO> getChat(int chatroom_num, int mem_num);
	
	
}
