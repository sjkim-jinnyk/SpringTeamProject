package com.spring.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.CouponOwnDTO;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;
import com.spring.model.OrderDTO;
import com.spring.model.OrderDeliverDTO;
import com.spring.model.ProductLikeDTO;
import com.spring.model.ReviewDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("test.do")
	public String test(Model model) {
		
		List<MemberDTO> list = this.dao.getMemberList();
		
		model.addAttribute("List", list);
		
		return "member/test";
	}
	
	@RequestMapping("member_home.do")
	public String home(@RequestParam("id") String id, Model model, OrderDTO dto) {
		
		MemberDTO mdto = this.dao.getMemberInfo(id);
		List<OrderDTO> odto = this.dao.getOrderList(id);
		List<OrderDeliverDTO> oddto = this.dao.getOrderDeliverList(dto);
		int coupon = this.dao.couponCount(id);
		int review = this.dao.reviewCount(id);
		int like = this.dao.likeCount(id);
		
		CouponOwnDTO cdto = new CouponOwnDTO(coupon);
		ReviewDTO rdto = new ReviewDTO(review);
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", cdto);
		model.addAttribute("Review", rdto);
		model.addAttribute("Like", ldto);
		model.addAttribute("Order", odto);
		model.addAttribute("Deliver", oddto);
		
		return "member/member_home";
	}
	
}
