package kr.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.cart.vo.CartVO;
@Mapper
public interface CartMapper {
	//카트 추가
	@Insert("INSERT INTO pcart (cart_num,store_num,order_quantity,mem_num) VALUES (pcart_seq.nextval,#{store_num},#{order_quantity},#{mem_num})")
	public int insertCart(CartVO cart) throws Exception;
	
	//회원별(mem_num) 총구매액
	@Select("SELECT SUM(sub_total) FROM (SELECT mem_num, order_quantity * store_price sub_total FROM pcart JOIN store USING(store_num)) WHERE mem_num=#{mem_num}")
	public int getTotalByMem_num(int mem_num)throws Exception;
	
	//카트 목록
	@Select("SELECT a.cart_num, a.mem_num, a.store_num, a.order_quantity, b.store_price FROM pcart a LEFT OUTER JOIN store b on a.store_num = b.store_num where a.mem_num = #{mem_num};")
	public List<CartVO> selectList(int mem_num);
	
	//카트 확인
	@Select("SELECT * FROM pcart WHERE store_num=#{store_num} AND mem_num=#{mem_num}")
	public CartVO selectCart(int cart_num);
	
	//카트 수정
	@Update("UPDATE pcart SET order_quantity=#{order_quantity} WHERE cart_num=#{cart_num}")
	public void updateCart(CartVO cart);
	
	//카트 상품번호와 회원번호별 수정
	@Update ("UPDATE pcart SET order_quantity=#{order_quantity} WHERE store_num=#{store_num} AND mem_num=#{mem_num}")
	public void updateCartByStore_num(CartVO cart)throws Exception;
	
	//카트 삭제
	@Delete("DELETE FROM pcart WHERE cart_num=#{cart_num}")
	public void deleteCart(int cart_num);
}
