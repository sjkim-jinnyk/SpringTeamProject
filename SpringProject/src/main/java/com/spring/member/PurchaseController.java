package com.spring.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PurchaseController {
	
	@RequestMapping("/purchase.do")
	public String purchase() {
		
		return "cart/purchase";
	}
	
	@RequestMapping("/paySuccess.do")
	public String paySuccess() {
		
		return "cart/paySuccess";
	}
	
	@RequestMapping("/payFail.do")
	public String payFail() {
		
		return "cart/payFail";
	}

}
