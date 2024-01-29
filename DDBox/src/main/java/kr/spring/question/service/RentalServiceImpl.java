package kr.spring.question.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.question.dao.RentalMapper;
import kr.spring.question.vo.RentalVO;

@Service
@Transactional
public class RentalServiceImpl implements RentalService{
	@Autowired
	RentalMapper rentalMapper;
	
	@Override
	public List<RentalVO> selectList(Map<String, Object> map) {
		return rentalMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return rentalMapper.selectRowCount(map);
	}

	@Override
	public void insertRental(RentalVO rental) {
		rentalMapper.insertRental(rental);
	}

	@Override
	public RentalVO selectRental(int rental_num) {
		return rentalMapper.selectRental(rental_num);
	}

	@Override
	public void updateRental(RentalVO rental) {
		
	}

	@Override
	public void deleteRental(int rental_num) {
		rentalMapper.deleteRental(rental_num);
	}

}
