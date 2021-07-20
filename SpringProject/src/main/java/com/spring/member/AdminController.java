package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.AdminDAO;
import com.spring.model.AdminDTO;
import com.spring.model.CateDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
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
		
		return "admin/admin_product_insert";
	}
	
	@RequestMapping("product_insert_ok.do")
	public void pro_insertOk(ProductDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap hm = upload.fileUpload(mRequest);
		boolean isUpload = (Boolean) hm.get("isUpload");
		String fileName = String.valueOf(hm.get("fileName"));
		
		if(isUpload) {
			
			dto.setPro_img(fileName);
			
			int result = this.dao.insertProduct(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('상품등록 성공')");
				out.println("location.href='admin_product_list.do'");
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

		rowsize = 10;
		totalRecord = this.dao.getProductAllListCount();

		PageDTO pageDTO = new PageDTO(page, rowsize, totalRecord);
		List<ProductDTO> list = this.dao.getProductAllList(pageDTO);
		List<CateDTO> cateList = this.dao.getCateList();
		// List<TagDTO> tList = this.dao.getTagList();
		
		
		List<CateDTO> cList = new ArrayList<CateDTO>();

		for (int i=0; i<list.size(); i++) {
			list.get(i).tag_split();
			cList.add(this.dao.getProductCate(list.get(i).getPro_category()));
		}
		
		model.addAttribute("page", pageDTO);
		model.addAttribute("List", list);
		model.addAttribute("category", cateList);
		model.addAttribute("cList", cList);
		
		return "admin/admin_product_list";
	}
	
	@RequestMapping("admin_product_cont.do")
	public String admin_pro_cont(@RequestParam int no, Model model) {
		
		ProductDTO dto = this.pdao.getProductCont(no);
		dto.tag_split();
		CateDTO cdto = this.dao.getProductCate(dto.getPro_category());
		
		model.addAttribute("dto", dto);
		model.addAttribute("cdto", cdto);
		
		return "admin/admin_product_cont";
	}
	
	@RequestMapping("product_update.do")
	public String admin_pro_update(@RequestParam int no, Model model) {
		
		ProductDTO dto = this.pdao.getProductCont(no);
		dto.tag_split();
		List<CateDTO> cateList = this.dao.getCateList();
		
		model.addAttribute("dto", dto);
		model.addAttribute("cdto", cateList);
		
		return "admin/admin_product_update";
	}
	
	@RequestMapping("product_update_ok.do")
	public void admin_pro_update_ok(ProductDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; UTR-8");
		PrintWriter out = response.getWriter();
		
		HashMap hm = upload.fileUpload(mRequest);
		boolean isUpload = (Boolean) hm.get("isUpload");
		String fileName = String.valueOf(hm.get("fileName"));
		
		if(isUpload) {
			
			dto.setPro_img(fileName);
			
			int result = this.dao.updateProduct(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('상품이 수정되었습니다.')");
				out.println("location.href='admin_product_cont.do?no="+dto.getPro_no()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('상품 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {
			int result = this.dao.updateProductNoImg(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('상품이 수정되었습니다.')");
				out.println("location.href='admin_product_cont.do?no="+dto.getPro_no()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('상품 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		
	}
	
	@RequestMapping("product_delete.do")
	public void admin_pro_delete(@RequestParam int no, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.deleteProduct(no);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('상품이 삭제되었습니다.')");
			out.println("location.href='admin_product_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('상품 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("admin_search_cate.do")
	public void admin_search_cate() {
		
	}
	
	@RequestMapping("admin_search_tag.do")
	public void admin_search_tag() {
		
	}
	
	@RequestMapping("category_list.do")
	public String category_insert(Model model) {
		
		List<CateDTO> list = this.dao.getCateList();
		//List<ProductDTO> pList = this.dao.getProductList(list);
		
		model.addAttribute("List", list);
		
		return "admin/admin_category_list";
	}
	
	@RequestMapping("category_insert.do")
	public void category_insert(CateDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.insertCategory(dto);
		
		if(result > 0) {
			out.println("<script>");
			out.println("location.href='category_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('카테고리 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("category_update.do")
	public void category_update(CateDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.updateCate(dto);
		
		if(result > 0) {
			out.println("<script>");
			out.println("location.href='category_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('카테고리 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("category_delete.do")
	public void category_delete(@RequestParam int no, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		int result = this.dao.deleteCate(no);
		
		if(result > 0) {
			out.println("<script>");
			out.println("location.href='category_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('카테고리 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	// :::::::::::::::::::::: 관리자 상품관련 end ::::::::::::::::::::::
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
