package kr.spring.question.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService{

	@Override
	public List<QuestionVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertQuestion(QuestionVO question) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QuestionVO selectQuestion(int board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(int board_hit) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateQuestion(QuestionVO question) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuestion(int board_num) {
		// TODO Auto-generated method stub
		
	}

}
