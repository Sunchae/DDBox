package kr.spring.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.reserve.dao.ShowMapper;
import kr.spring.reserve.dao.TicketMapper;
import kr.spring.reserve.vo.TicketVO;

@Service
@Transactional
public class TicketServiceImpl implements TicketService{
	
	@Autowired
	private TicketMapper ticketMapper;
	
	@Override
	public void insertTicket(TicketVO ticket) {
		ticketMapper.insertTicket(ticket);
	}

}
