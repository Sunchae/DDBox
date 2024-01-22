package kr.spring.event.service;

import java.util.List;
import java.util.Map;

import kr.spring.event.vo.Event_listVO;

public interface EventService {
	//이벤트 글 등록
	public List<Event_listVO> selectList(Map<String,Object> map);//이벤트 전체 목록/검색 목록
	public int selectRowCount(Map<String,Object> map);//이벤트 글의 총개수/검색 개수
	public void insertEvent(Event_listVO event);//이벤트 글등록
	public Event_listVO selectEvent(int event_num);//이벤트 글상세
	public void updateEvent(Event_listVO event);//이벤트 글수정
	public void deleteEvent(int event_num);//이벤트 글 삭제
	public void deleteFile(int event_num);//특정 경로의 파일 올렸을때 삭제(filename을 event_photo1,2)
}
