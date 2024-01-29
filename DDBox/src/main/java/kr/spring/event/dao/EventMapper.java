package kr.spring.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.event.vo.Entry_listVO;
import kr.spring.event.vo.Event_listVO;

@Mapper
public interface EventMapper {
	//이벤트 글 등록
	public List<Event_listVO> selectList(Map<String,Object> map);//이벤트 전체 목록/검색 목록
	public int selectRowCount(Map<String,Object> map);//이벤트 글의 총개수/검색 개수
	public void insertEvent(Event_listVO event);//이벤트 글등록
	public Event_listVO selectEvent(int event_num);//이벤트 글상세
	public void updateEvent(Event_listVO event);//이벤트 글수정
	public void deleteEvent(int event_num);//이벤트 글 삭제
	public void deleteFile(int event_num);//특정 경로의 파일 올렸을때 삭제(filename을 event_photo1,2)
	
	//참여자 리스트
	public List<Entry_listVO> selectEntryList(Map<String,Object> map);//이베트 참여자 리스트 목록
	public void insertEntry(Entry_listVO entry);//이벤트 참여자 등록
	public Entry_listVO selectEntry(int entry_num);//참여자 등록 상세
	public void updateEntry(Event_listVO entry);//참여자 글등록 수정
}
