package kr.spring.cart.vo;

import java.sql.Date;

import kr.spring.store.vo.StoreVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	private int cart_num;
	private int store_num;
	private int order_quantity;
	private Date reg_date;
	private int mem_num;
	private int sub_total;	//단일상품 총 구매 비용
	
	private StoreVO storeVO;
	
	
}
