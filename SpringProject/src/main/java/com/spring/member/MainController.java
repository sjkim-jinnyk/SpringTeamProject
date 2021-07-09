package com.spring.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("main.do")
	public String go_main() {
		return "home";
	}
	
	@RequestMapping("about.do")
	public String go_about() {
		return "about";
	}
}
