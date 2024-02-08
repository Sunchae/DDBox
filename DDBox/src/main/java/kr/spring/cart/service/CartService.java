package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import kr.spring.cart.vo.CartVO;

public interface CartService {
		//카트 추가
		public int insertCart(CartVO cart, Map<String, Object> map) throws Exception;
		
		//회원별 총 구매액
		public int getTotalByMem_num(int mem_num)throws Exception;
		
		//카트 목록
		public List<CartVO> selectList(int mem_num);
		
		//카트확인
		public CartVO selectCart(int cart_num);
		
		//카트 수정
		public void updateCart(CartVO cart);
		
		//장바구니 상품번호와 회원번호별 수정
		public void updateCartByStore_num(CartVO cart)throws Exception;
		
		//카트 글 삭제
		public void deleteCart(int cart_num);
}
