package kr.spring.reserve.service;

import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ScreenVO;
import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

public interface TicketService {
	public void insertTicket(TicketVO ticket);
	
	public ShowVO selectTicket(int choice_num,int choice_screen,int choice_time);
	
	public MovieVO selectedMoive(int choice_num);
	
	public ScreenVO selectedScreen(int choice_screen);
	
	public ShowVO selectedShow(int choice_time);
	
	public TicketVO selectedPPL(int choice_people);
	
	public TicketVO selectedPrice(int choice_price);
}
