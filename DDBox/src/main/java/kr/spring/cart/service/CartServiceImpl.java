package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.cart.dao.CartMapper;
import kr.spring.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService{
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public List<CartVO> selectList(Map<String, Object> map) {
		return cartMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}

	@Override
	public int getTotalByMem_num(int mem_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CartVO selectCart(int cart_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCart(CartVO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCartByStore_num(CartVO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCart(int cart_num) {
		// TODO Auto-generated method stub
		
	}

}
