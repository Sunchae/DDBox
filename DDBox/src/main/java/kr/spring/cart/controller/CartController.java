package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired
	private CartService cartService;
	
	/*=================================
	 *	장바구니 목록
	 *=================================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	
	@RequestMapping("/cart/list")
	public String cartList(HttpSession session,Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CartVO> list = null;
		list = cartService.selectList(map);
		
		model.addAttribute("list", list);
		
		return "cartList";
	}

}
