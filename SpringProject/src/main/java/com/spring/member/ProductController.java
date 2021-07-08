package com.spring.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.ProductDAO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO dao;
	
	@RequestMapping("product_list.do")
	public String product_list() {
		
		return "Product/product_list";
	}
	
	@RequestMapping("product_recent.do")
	public String product_history() {
		
		return "Product/product_recent";
	}
	
	@RequestMapping("product_cont.do")
	public String product_cont() {
		
		return "Product/product_cont";
	}
	
	@RequestMapping("cart.do")
	public String cart() {
		
		return "Cart/cart";
	}
	
	
	
}
