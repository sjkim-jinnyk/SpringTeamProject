package com.spring.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String review_list(HttpServletRequest request, Model model) {
		
		int page = 0;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		
		rowsize = 8;
		totalRecord = this.dao.getReivewListCount();
				
		PageDTO pageDTO = new PageDTO(page, rowsize, totalRecord);
		List<ReviewDTO> list = this.dao.getReviewList(pageDTO);
		
		model.addAttribute("page", pageDTO);
		model.addAttribute("List", list);
		
		return "review/review_list";
	}
	
	@RequestMapping("review_cont.do")
	public String review_cont(@RequestParam("no") int no,
			Model model) {
		
		ReviewDTO dto = this.dao.getReviewCont(no);
		
		model.addAttribute("cont", dto);
		
		return "review/review_cont";
	}
	
	
}
