package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.cart.dao.CartMapper;
import kr.spring.cart.vo.CartVO;

@Transactional
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int insertCart(CartVO cart, Map<String, Object> map) throws Exception {
		return cartMapper.insertCart(cart);
	}
	@Override
	public List<CartVO> selectList(int mem_num) {
		List<CartVO> cart = cartMapper.selectList(mem_num);
		
		return cart;
	}

	@Override
	public CartVO selectCart(int cart_num) {
		return cartMapper.selectCart(cart_num);
	}

	@Override
	public void updateCart(CartVO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCart(int cart_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalByMem_num(int mem_num) throws Exception {
		return cartMapper.getTotalByMem_num(mem_num);
	}

	@Override
	public void updateCartByStore_num(CartVO cart) throws Exception {
		cartMapper.updateCartByStore_num(cart);
	}


}
