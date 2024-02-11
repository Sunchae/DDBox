package kr.spring.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.payment.vo.PayVO;
import kr.spring.store.vo.StoreVO;

@Mapper
public interface PayMapper {
	//결제등록
	public void insertPay(PayVO pay);			//xml
	//결제상세
	public PayVO selectPay(int pay_num);
	
	@Select("SELECT pay_id, store_title, total_price, pay_date FROM pay WHERE mem_num=#{mem_num}")
	public List<PayVO> selectList(int mem_num);
	//
	@Select("SELECT store_num, store_title, store_photo, store_price FROM store WHERE store_num=#{store_num}")
	public StoreVO selectStore(int store_num);
	
}
