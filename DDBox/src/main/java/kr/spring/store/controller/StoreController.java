package kr.spring.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.store.service.StoreService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/store/main")
	public String process() {
		
		return "storeMain";
	}
	
}
