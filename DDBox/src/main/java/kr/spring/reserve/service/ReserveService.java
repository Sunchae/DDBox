package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

public interface ReserveService {
	
	//예매 영화 정보
		public List<TicketVO> selectShowList(Map<String,Object> map);
		
		//예매 극장 정보
		public List<ScreenVO> selectScreenList(Map<String,Object> map);
		
		//예매 시간 정보
		public List<ShowVO> selectTimeList(Map<String,Object> map);
}
