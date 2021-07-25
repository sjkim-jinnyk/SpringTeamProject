package com.spring.member;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("main.do")
	public String go_main() {	
		return "home";
	}
	
	@RequestMapping("about.do")
	public String go_about() {
		return "about/about";
	}
}
