package kr.spring.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.reserve.vo.ScreenVO;

@Mapper
public interface ScreenMapper {
	//극장 선택
	@Select("SELECT * FROM screen WHERE scr_num=#{scr_num}")
	public ScreenVO selectedScreen(int scr_num);
	
	@Select("")
	public List<ScreenVO> selectTimeList(int scr_num);
}
