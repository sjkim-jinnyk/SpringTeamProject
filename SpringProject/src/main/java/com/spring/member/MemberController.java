package com.spring.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;

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
	public String home(@RequestParam("id") String id, Model model) {
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		model.addAttribute("cont", dto);
		
		return "member/member_home";
	}
	
}
