package kr.spring.reserve.service;

import java.util.List;

import kr.spring.reserve.vo.ScreenVO;

public interface ScreenService {
	//극장 선택
	public ScreenVO selectedScreen(int scr_num);
	//상영시간 list 처리
	public List<ScreenVO> selectTimeList(int scr_num);
}
