package kr.spring.question.service;

import java.util.List;
import java.util.Map;

import kr.spring.question.vo.EmailVO;

public interface EmailService {
	public List<EmailVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertEmail(EmailVO email);
	public EmailVO selectEmail(int qna_num); //한건의 레코드 반환
	public void updateEmail(EmailVO email);
	public void deleteEmail(int qna_num);
}
