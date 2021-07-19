package com.spring.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.AdminDAO;
import com.spring.model.AdminDTO;
import com.spring.model.PageDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao;

	private int totalRecord = 0;
	private int rowsize = 0;

	@RequestMapping("admin_list.do")
	public String list(HttpServletRequest request, Model model) {

		int page = 0;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}

		rowsize = 4;
		totalRecord = this.dao.getListCount();

		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		List<AdminDTO> pagelist = this.dao.getMemberList(dto);

		model.addAttribute("Page", dto);
		model.addAttribute("List", pagelist);

		return "admin/admin_member";

	}

	@RequestMapping("product_insert.do")
	public String insert() {
		
		return "priduct_insert";
		
	}
	
	

	@RequestMapping("admin_cont.do")
	public String content(@RequestParam("no") int member_no,
			@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세내역 조회하는 메서드 호출
		AdminDTO dto = this.dao.memberCont(member_no);
		
		model.addAttribute("content", dto);
		
		model.addAttribute("page", nowPage);
		
		return "admin/admin_content";
		
	}
	
	@RequestMapping("/member_search.do")
	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, Model model, HttpServletRequest request) {
		
		int page = 0;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		
		rowsize = 10;
		
		// 인자를 하나로 모아 넘겨주기 위해 hashmap으로 모아줌
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("field", field);
		hm.put("keyword", keyword);
		
		// 검색해서 나오는 회원의 전체 수 (select count(*))
		totalRecord = this.dao.searchMemberListCount(hm); 	
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord, field, keyword);
		List<AdminDTO> list = this.dao.searchMemberList(dto);

		model.addAttribute("searchList", list);
		model.addAttribute("page", dto);

		return "admin/member_search";

	}
}
