package kr.spring.reserve.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.reserve.vo.ShowVO;
import kr.spring.reserve.vo.TicketVO;

@Mapper
public interface TicketMapper {
	//예매 인원 티켓 가격 insert
	@Insert("INSERT INTO ticket (res_num,res_mem_total,res_pay) VALUES (ticket_seq.nextval,#{res_mem_total},#{res_pay})")
	public void insertTicket(TicketVO ticket);
}
