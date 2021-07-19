package com.spring.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.ReviewDAO;
import com.spring.model.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDAO dao;
	
	private int totalRecord = 0;
	private int rowsize = 0;
	
	@RequestMapping("review_list.do")
	public String review_list() {
		
	
		return "review/review_list";
	}
	
}
