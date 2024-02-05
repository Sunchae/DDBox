package kr.spring.cart.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("/cart/cartList")
	public String cartList(HttpSession session,Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CartVO> list = null;
		list = cartService.selectList(map);
		
		model.addAttribute("list", list);
		
		return "cartList";
	}

	/*=================================
	 *	장바구니 등록
	 *=================================*/
	@ResponseBody
	@PostMapping("/cart/insert")
	public String cartInsert(@Valid CartVO cartVO, BindingResult result, HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException{
		log.debug("<<장바구니 등록>> : " + cartVO);
		
		//회원번호 세팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		cartVO.setMem_num(vo.getMem_num());
		cartService.insertCart(cartVO);
		
		//뷰에 표시할 메세지
		model.addAttribute("message", "장바구니 등록이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+ "/cart/cartList");
		
		return "common/resultAlert";
	}
	/*=================================
	 *	장바구니 상세
	 *=================================*/
	@RequestMapping("/cart/cartDetail")
	public ModelAndView cartDetail(@RequestParam int cart_num) {
		log.debug("<<장바구니 상세 cart_num>> : " + cart_num);
		CartVO cart = cartService.selectCart(cart_num);
		
		return new ModelAndView("cartDetail","cart",cart);
	}
}
