package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

@Service
@Transactional
public class ReserveServiceImpl implements ReserveService{

	@Override
	public List<TicketVO> selectShowList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ScreenVO> selectScreenList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ShowVO> selectTimeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
