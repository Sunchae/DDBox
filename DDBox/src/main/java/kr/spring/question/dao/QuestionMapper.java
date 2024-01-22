package kr.spring.question.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.question.vo.QuestionVO;

@Mapper
public interface QuestionMapper {
	public List<QuestionVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertQuestion(QuestionVO question);
	public QuestionVO selectQuestion(int board_num); //한건의 레코드 반환
	public void updateHit(int board_hit);
	public void updateQuestion(QuestionVO question);
	public void deleteQuestion(int board_num);
}
