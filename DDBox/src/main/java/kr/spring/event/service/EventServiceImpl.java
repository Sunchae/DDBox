package kr.spring.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.event.dao.EventMapper;
import kr.spring.event.vo.Rentry_listVO;
import kr.spring.event.vo.Entry_listVO;
import kr.spring.event.vo.Event_listVO;

@Service
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventMapper eventMapper;
	
	@Override
	public List<Event_listVO> selectList(Map<String, Object> map) {
		return eventMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return eventMapper.selectRowCount(map);
	}

	@Override
	public void insertEvent(Event_listVO event) {
		eventMapper.insertEvent(event);
		
	}

	@Override
	public Event_listVO selectEvent(int event_num) {
		return eventMapper.selectEvent(event_num);
	}

	@Override
	public void updateEvent(Event_listVO event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEvent(int event_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(int event_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Rentry_listVO> selectRentryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertRentry(Rentry_listVO rentry) {
		eventMapper.insertRentry(rentry);
		
	}

	@Override
	public Rentry_listVO selectRentry(int rentry_num) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public void insertEntry(Entry_listVO entry) {
		eventMapper.insertEntry(entry);
	}

	/*
	 * @Override public List<Entry_listVO> selectEntry(int entry_num) { return
	 * eventMapper.selectEntry(entry_num); }
	 */

	@Override
	public List<Entry_listVO> selectEntry(Map<String, Object> map,int event_num) {
		// TODO Auto-generated method stub
		return eventMapper.selectEntry(map, event_num);
	}

}
