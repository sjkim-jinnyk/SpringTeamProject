package com.spring.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.AdminDAO;
import com.spring.model.AdminDTO;
import com.spring.model.CateDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.ProductLikeDTO;
import com.spring.model.ProductRecentDTO;
import com.spring.model.Upload;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	@Autowired
	private Upload upload;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// :::::::::::::::::::::: 관리자 상품관련 ::::::::::::::::::::::
	
	@RequestMapping("product_insert.do")
	public String pro_insert(Model model) {
		
		List<CateDTO> list = this.dao.getCateList();
		model.addAttribute("list", list);
		
		return "admin/product_insert";
	}
	
	@RequestMapping("product_insert_ok.do")
	public void pro_insertOk(ProductDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap hm = upload.fileUpload(mRequest);
		boolean isUpload = (Boolean) hm.get("isUpload");
		String fileName = (String) hm.get("fileName");
		
		if(isUpload) {
			
			dto.setPro_img(fileName);
			
			int result = this.dao.insertProduct(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('상품등록 성공')");
				out.println("location.href='main.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('상품등록 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}
	
	@RequestMapping("admin_product_list.do")
	public String pro_list(HttpServletRequest request, HttpSession session, Model model) {
		
		int page = 0;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}

		rowsize = 8;
		totalRecord = this.pdao.getProductListCount();

		PageDTO pageDTO = new PageDTO(page, rowsize, totalRecord);
		List<ProductDTO> list = this.pdao.getProductList(pageDTO);

		for (int i=0; i<list.size(); i++) {
			list.get(i).tag_split();
		}
		
		model.addAttribute("page", pageDTO);
		model.addAttribute("List", list);
		
		return "admin/product_list";
	}
	
	
	// :::::::::::::::::::::: 관리자 상품관련 end ::::::::::::::::::::::
}
