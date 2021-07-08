package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.CartDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.QnaDAO;
import com.spring.model.QnaDTO;
import com.spring.model.ReviewDAO;
import com.spring.model.ReviewDTO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO dao;

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
		totalRecord = this.dao.getProductListCount();

		PageDTO pageDTO = new PageDTO(page, rowsize, totalRecord);
		List<ProductDTO> list = this.dao.getProductList(pageDTO);

		model.addAttribute("page", pageDTO);
		model.addAttribute("List", list);

		return "Product/product_list";
	}

	@RequestMapping("product_recent.do")
	public String product_history() {

		return "Product/product_recent";
	}

	@RequestMapping("product_cont.do")
	public String product_cont(@RequestParam("no") int pro_no, HttpServletRequest request, Model model) {

		// 상품 상세 설명
		ProductDTO pdto = this.dao.getProductCont(pro_no);

		// 리뷰 게시판
		int rpage = 0;
		if (request.getParameter("rpage") != null) {
			rpage = Integer.parseInt(request.getParameter("rpage"));
		} else {
			rpage = 1;
		}

		rowsize = 5;
		totalRecord = this.dao.getReviewListCount(pro_no);

		PageDTO rpageDTO = new PageDTO(rpage, rowsize, totalRecord, pro_no);
		List<ReviewDTO> rlist = this.dao.getReviewList(rpageDTO);

		int star = this.dao.getTotalStar(pro_no);

		// qna 게시판
		int qpage = 0;
		if (request.getParameter("qpage") != null) {
			qpage = Integer.parseInt(request.getParameter("qpage"));
		} else {
			qpage = 1;
		}

		int qtotalRecord = this.dao.getProQnaListCount(pro_no);

		PageDTO qpageDTO = new PageDTO(qpage, rowsize, qtotalRecord, pro_no);
		List<QnaDTO> qlist = this.dao.getProQnaList(qpageDTO);

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

	@RequestMapping("cart.do")
	public String cart(HttpServletRequest request, Model model) {

		String user_id = null;
		List<Integer> proList = new ArrayList<Integer>();
		List<ProductDTO> plist = new ArrayList<ProductDTO>();

		// 로그인한 회원은 회원 아이디로, 로그인 하지 않았으면 손님 아이디로
		HttpSession session = request.getSession();
		if (session.getAttribute("loginId") != null) {
			user_id = (String) session.getAttribute("userId");
		} else {
			user_id = "guest";
		}

		// 회원별 장바구니 조회
		List<CartDTO> clist = this.dao.getCartList(user_id);

		if (!clist.isEmpty()) {
			// 장바구니에 저장된 상품 번호 목록을 리스트에 저장
			for (int i = 0; i < clist.size(); i++) {
				proList.add(clist.get(i).getProduct_no());
				
			}

			plist = this.dao.getMemCart(proList); // 상품별 상세내용 조회하여 리스트에 저장
		}

		model.addAttribute("pList", plist);
		model.addAttribute("cList", clist);

		return "Cart/cart";
	}

	@RequestMapping("add_cart.do")
	public void add_cart(HttpServletRequest request, HttpServletResponse response, CartDTO dto, Model model) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String user_id = null;
		int result = 0;

		// 로그인한 회원은 회원 아이디로, 로그인 하지 않았으면 손님 아이디로
		HttpSession session = request.getSession();
		if (session.getAttribute("loginId") != null) {
			user_id = (String) session.getAttribute("userId");
		} else {
			user_id = "guest";
		}
		
		dto.setUser_id(user_id);
		
		int check = this.dao.checkCart(dto);
		
		if(check == 0) {	// 동일한 상품이 장바구니에 없는 경우
			result = this.dao.addCart(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('장바구니 담기 성공')");
				out.println("location.href='cart.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('장바구니 담기 실패')");
				out.println("histroy.back()");
				out.println("</script>");
			}
			
		}else {	// 동일한 상품이 장바구니에 있는 경우
			result = this.dao.updateAmount(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('장바구니 담기 성공')");
				out.println("location.href='cart.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('장바구니 담기 실패')");
				out.println("histroy.back()");
				out.println("</script>");
			}
		}
			
		
	}

}
