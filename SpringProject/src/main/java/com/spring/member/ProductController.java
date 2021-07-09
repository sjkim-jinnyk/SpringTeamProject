package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.PageDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.ProductRecentDAO;
import com.spring.model.ProductRecentDTO;
import com.spring.model.QnaDTO;
import com.spring.model.ReviewDTO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pdao;
	private ProductRecentDAO rdao;

	private int totalRecord = 0;
	private int rowsize = 0;

	@RequestMapping("product_list.do")
	public String product_list(HttpServletRequest request, Model model) {

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

		model.addAttribute("page", pageDTO);
		model.addAttribute("List", list);

		return "Product/product_list";
	}

	@RequestMapping("product_cont.do")
	public String product_cont(@RequestParam("no") int pro_no, HttpSession session, HttpServletRequest request, Model model) {
		
		String user_id = (String) session.getAttribute("userId");
		if(user_id == null) user_id = "guest";
		
		ProductDTO pdto = this.pdao.getProductCont(pro_no); // 상품 상세 설명
		
		ProductRecentDTO rdto = new ProductRecentDTO();
		rdto.setRecent_product(pro_no);
		rdto.setRecent_mem(user_id);
		
		int check = this.pdao.recentProCheck(rdto);	// 최근 본 상품 중 동일 상품이 있는지 확인
		if(check > 0) {
			this.pdao.updateRecentPro(rdto);	// 동일한 상품이 있는 경우 가장 최근 조회 시간으로 수정
		}else {
			this.pdao.addRecent(rdto); // 최근 본 상품에 추가
		}

		// 리뷰 게시판
		int rpage = 0;
		if (request.getParameter("rpage") != null) {
			rpage = Integer.parseInt(request.getParameter("rpage"));
		} else {
			rpage = 1;
		}

		rowsize = 5;
		totalRecord = this.pdao.getReviewListCount(pro_no);

		PageDTO rpageDTO = new PageDTO(rpage, rowsize, totalRecord, pro_no);
		List<ReviewDTO> rlist = this.pdao.getReviewList(rpageDTO);

		int star = this.pdao.getTotalStar(pro_no);

		// qna 게시판
		int qpage = 0;
		if (request.getParameter("qpage") != null) {
			qpage = Integer.parseInt(request.getParameter("qpage"));
		} else {
			qpage = 1;
		}

		int qtotalRecord = this.pdao.getProQnaListCount(pro_no);

		PageDTO qpageDTO = new PageDTO(qpage, rowsize, qtotalRecord, pro_no);
		List<QnaDTO> qlist = this.pdao.getProQnaList(qpageDTO);

		model.addAttribute("cont", pdto);

		model.addAttribute("review", rlist);
		model.addAttribute("rpage", rpageDTO);
		model.addAttribute("rtotal", totalRecord);
		model.addAttribute("star", star);

		model.addAttribute("qna", qlist);
		model.addAttribute("qpage", qpageDTO);
		model.addAttribute("qtotal", qtotalRecord);

		return "Product/product_cont";
	}
	
	@RequestMapping("product_recent.do")
	public String product_recent(HttpSession session, Model model) {
		
		String user_id = (String) session.getAttribute("loginId");
		if(user_id == null) user_id = "guest"; 
		
		int check = this.pdao.recentCheck(user_id);	// 최근 본 상품 여부 확인
		
			if(check > 0) { 	// 최근 본 상품이 있는 경우
				List<ProductRecentDTO> list = this.pdao.getRecentList(user_id); 
				model.addAttribute("list", list); 
			}
		 
		return "Product/product_recent";
	}
	
	@RequestMapping("recent_delete.do")
	public void recent_delete(@RequestParam("no") int no, HttpSession session, HttpServletResponse response, Model model) throws IOException {
		
		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();
		
		String user_id = (String) session.getAttribute("loginId");
		if(user_id == null) user_id = "guest"; 
		
		ProductRecentDTO dto = new ProductRecentDTO();
		dto.setRecent_product(no);
		dto.setRecent_mem(user_id);
		
		int result = this.pdao.deleteRecent(dto);
		
		if (result > 0) {
			out.println("<script>");
			out.println("alert('최근 본 상품 지우기 성공')");
			out.println("location.href='product_recent.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('최근 본 상품 지우기 실패')");
			out.println("histroy.back()");
			out.println("</script>");
		}
		
	}

}
