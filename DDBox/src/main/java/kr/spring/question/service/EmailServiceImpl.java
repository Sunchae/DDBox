package kr.spring.question.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.question.dao.EmailMapper;
import kr.spring.question.vo.EmailVO;

@Service
@Transactional
public class EmailServiceImpl implements EmailService{
	@Autowired
	EmailMapper emailMapper;
	
	@Override
	public List<EmailVO> selectList(Map<String, Object> map) {
		return emailMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public void insertEmail(EmailVO email) {
		
	}

	@Override
	public EmailVO selectEmail(int qna_num) {
		return null;
	}

	@Override
	public void updateEmail(EmailVO email) {
		
	}

	@Override
	public void deleteEmail(int qna_num) {
		
	}

}
