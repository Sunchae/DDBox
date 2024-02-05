package kr.spring.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.payment.service.KakaoPayService;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class PaymentController{
	
	@Setter(onMethod_=@Autowired)
	private KakaoPayService kakaopay;
	
	@GetMapping("/kakaoPay/kakaoPay")
	public void kakaoPayGet() {
		
	}
	
	@PostMapping("/kakaoPay/kakaoPay")
	public String kakaoPay() {
		log.info("kakaopay post..................");
		
		return "redirect:" + kakaopay.KakaoPayReady();
	}
	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("kakaoPaySuccess get.............................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	}
}
