package kr.spring.question.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.question.vo.RentalVO;

@Mapper
public interface RentalMapper {
	public List<RentalVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	public void insertRental(RentalVO rental);
	public RentalVO selectRental(int rental_num);
	public void updateRental(RentalVO rental);
	@Delete("DELETE FROM rental WHERE rental_num=#{rental_num}")
	public void deleteRental(int rental_num);
}
