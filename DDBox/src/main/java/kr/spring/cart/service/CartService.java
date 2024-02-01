package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import kr.spring.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertCart(CartVO cart);
	public int getTotalByMem_num(int mem_num);
	public CartVO selectCart(int cart_num);
	public void updateCart(CartVO cart);
	public void updateCartByStore_num(CartVO cart);
	public void deleteCart(int cart_num);
}
