package kr.spring.cart.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	
	@PostMapping("/cart/cartInsert")
	@ResponseBody
	public String insertCart(@Valid CartVO cartVO, HttpSession session, HttpServletRequest request,Model model) throws Exception {
		
		log.debug("<<장바구니 등록>> : " + cartVO);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartVO", cartVO);
		map.put("mem_num", user.getMem_num());
		
		
		int insertCart = cartService.insertCart(cartVO, map);
		
		model.addAttribute("message", "장바구니 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/cart/cartDetail");
		
		return insertCart +  "cartDetail";
	}
	
	//카트 상세
	@RequestMapping("/cart/cartDetail")
	public ModelAndView cartDetail(@RequestParam int cart_num, Model model) {
		log.debug("<<카트 상세페이지 cart_num>> : " + cart_num);
		CartVO cart = cartService.selectCart(cart_num);
		
		return new ModelAndView("cartDetail","cart",cart);
	}
}
