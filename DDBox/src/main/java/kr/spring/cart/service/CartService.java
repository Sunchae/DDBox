package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import kr.spring.cart.vo.CartVO;

public interface CartService {
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
