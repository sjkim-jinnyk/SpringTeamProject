package com.spring.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("login_result.do")
	public String naver_login() {
		
		
		
		return "login/login_result";
	}
}
