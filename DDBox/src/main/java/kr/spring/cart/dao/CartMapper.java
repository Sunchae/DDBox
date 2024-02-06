package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.cart.vo.CartVO;
@Mapper
public interface CartMapper {
	//카트 추가
	public int insertCart(CartVO cart) throws Exception;
	
	//카트 목록
	public List<CartVO> selectList(Map<String, Object> map);
	
	//카트확인
	public CartVO selectCart(int cart_num);
	
	//카트 수정
	public void updateCart(CartVO cart);
	
	//카트 글 삭제
	public void deleteCart(int cart_num);
}
