package kr.spring.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.reserve.dao.ScreenMapper;
import kr.spring.reserve.vo.ScreenVO;

@Service
@Transactional
public class ScreenServieImpl implements ScreenService{
	@Autowired
	private ScreenMapper screenMapper;

	@Override
	public ScreenVO selectedScreen(int scr_num) {
		return screenMapper.selectedScreen(scr_num);
	}

	@Override
	public List<ScreenVO> selectTimeList(int scr_num) {
		return screenMapper.selectTimeList(scr_num); 
	}

	
}
