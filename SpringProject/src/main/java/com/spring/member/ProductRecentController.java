package com.spring.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.model.ProductRecentDAO;

@Controller
public class ProductRecentController {

	@Autowired
	private ProductRecentDAO dao;
	
}
