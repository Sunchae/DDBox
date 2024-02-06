package kr.spring.cart.controller;

import java.lang.reflect.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/insert")
	@ResponseBody
	public String insertCart(@Valid CartVO cart, HttpSession session, HttpServletRequest request,Model model) throws Exception {
		
		log.debug("<<장바구니 등록>> : " + cart);
		
		MemberVO vo = (MemberVO)session.getAttribute("user");
		if(vo == null) {
			return"5";
		}
		cart.setMem_num(vo.getMem_num());
		
		cartService.insertCart(cart);
		
		model.addAttribute("message", "장바구니 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/cart/cartList");
		
		return "common/resultAlert";
	}
}
