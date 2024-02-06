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
	public int insertCart(CartVO cart) throws Exception {
		cartMapper.insertCart(cart);
		if(cart != null) {
			return 2;
		}
		try {
			return cartMapper.insertCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<CartVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
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
	public void deleteCart(int cart_num) {
		// TODO Auto-generated method stub
		
	}

}
