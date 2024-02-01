package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.reserve.dao.ShowMapper;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

@Service
@Transactional
public class ShowServiceImpl implements ShowService{
	@Autowired
	private ShowMapper showMapper;

	@Override
	public List<ShowVO> selectShowList(Map<String, Object> map) {
		return showMapper.selectShowList(map);
	}

	@Override
	public int selectRowShowCount(Map<String, Object> map) {
		return showMapper.selectRowShowCount(map);
	}

	@Override
	public void insertShow(ShowVO show) {
		showMapper.insertShow(show);
	}

	@Override
	public ShowVO selectShow(int movie_num, int shw_num) {
		return showMapper.selectShow(movie_num, shw_num);
	}
	

	@Override
	public void updateShow(ShowVO show) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteShow(int shw_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ShowVO> selectShowListForRev(int movie_num) {
		return showMapper.selectShowListForRev(movie_num);
	}

	

}
