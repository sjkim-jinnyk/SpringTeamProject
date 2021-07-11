package com.spring.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.ProductRecentDAO;
import com.spring.model.ProductRecentDTO;

@Controller
public class ProductRecentController {

	@Autowired
	private ProductRecentDAO dao;
	
	
	
}
