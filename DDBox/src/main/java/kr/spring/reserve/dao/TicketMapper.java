package kr.spring.reserve.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

@Mapper
public interface TicketMapper {
	//예매 인원 티켓 가격 insert
	@Insert("INSERT INTO ticket (res_num,res_mem_total,res_pay,res_regdate) VALUES (ticket_seq.nextval,#{res_mem_total},#{res_pay},SYSDATE)")
	public void insertTicket(TicketVO ticket);
	
	@Select("SELECT movie_title,scr_name,shw_time FROM show LEFT OUTER JOIN (SELECT * FROM screen) USING(scr_num) LEFT OUTER JOIN (SELECT * FROM movie) USING(movie_num)WHERE movie_num= #{choice_num} AND scr_num = #{choice_screen} AND shw_num=#{choice_time}")
	public ShowVO selectTicket(int choice_num,int choice_screen,int choice_time);
	
	@Select("SELECT movie_num, movie_title FROM movie WHERE movie_num=#{choice_num} ")
	public MovieVO selectedMoive(int choice_num);
	
	@Select("SELECT scr_num, scr_name FROM screen WHERE scr_num=#{choice_screen}")
	public ScreenVO selectedScreen(int choice_screen);
	
	@Select("SELECT shw_num, shw_time FROM show WHERE shw_num=#{choice_time}")
	public ShowVO selectedShow(int choice_time);
	
	//public TicketVO selectedPPL(int choice_people);
	
}