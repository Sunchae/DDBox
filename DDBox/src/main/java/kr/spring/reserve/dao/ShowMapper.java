package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

@Mapper
public interface ShowMapper {
	//예매 리스트
	public List<ShowVO> selectShowList(Map<String,Object> map);
	public int selectRowShowCount(Map<String,Object> map);
	
	public List<ShowVO> selectShowListForRev(int movie_num);
	
	//예매 등록
	public void insertShow(ShowVO show);
	//한건의 예매 읽기
	@Select("SELECT * FROM show JOIN movie USING(movie_num) WHERE movie_num=#{movie_num} AND scr_num=#{scr_num}")
	public ShowVO selectShow(int movie_num, int shw_num);
	
	//예매 수정
	public void updateShow(ShowVO show);
	//예매 삭제
	@Delete("DELETE FROM show WHERE shw_num=#{shw_num}")
	public void deleteShow(int shw_num);
}
