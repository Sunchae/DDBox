package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.CartVO;


@Mapper
public interface CartMapper{
	@Select("SELECT * FROM pcart WHERE cart_num=#{cart_num} AND mem_num=#{mem_num}")
	public List<CartVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertCart(CartVO cart);						//xml
	public int getTotalByMem_num(int mem_num);
	@Select("SELECT * FROM pcart WHERE store_num=#{store_num} AND mem_num=#{mem_num}")
	public CartVO selectCart(int cart_num);
	public void updateCart(CartVO cart);
	public void updateCartByStore_num(CartVO cart);
	public void deleteCart(int cart_num);
	
}
