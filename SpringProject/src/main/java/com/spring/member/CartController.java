package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.CartDAO;
import com.spring.model.CartDTO;
import com.spring.model.ProductDTO;

@Controller
public class CartController {

	@Autowired
	private CartDAO dao;

	@RequestMapping("cart.do")
	public String cart(HttpSession session, HttpServletRequest request, Model model) {

		List<Integer> proList = new ArrayList<Integer>();
		List<ProductDTO> plist = new ArrayList<ProductDTO>();

		// 로그인한 회원은 회원 아이디로, 로그인 하지 않았으면 손님 아이디로
		String user_id = (String) session.getAttribute("loginId");
		if (user_id == null) user_id = "guest";

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

		return "cart/cart";
	}

	@RequestMapping("add_cart.do")
	public void add_cart(HttpSession session, HttpServletRequest request, HttpServletResponse response, CartDTO dto,
			Model model) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = 0;

		// 로그인한 회원은 회원 아이디로, 로그인 하지 않았으면 손님 아이디로
		String user_id = (String) session.getAttribute("loginId");
		if (user_id == null) user_id = "guest";

		dto.setUser_id(user_id);
		
		if(dto.getCart_amount() == 0) {
			dto.setCart_amount(1);
		}

		int check = this.dao.checkCart(dto);

		if (check == 0) { // 동일한 상품이 장바구니에 없는 경우
			result = this.dao.addCart(dto);

			if (result > 0) {
				out.println("<script>");
				out.println("alert('장바구니 담기 성공')");
				out.println("location.href='cart.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('장바구니 담기 실패')");
				out.println("histroy.back()");
				out.println("</script>");
			}

		} else { // 동일한 상품이 장바구니에 있는 경우
			result = this.dao.updateAmount(dto);

			if (result > 0) {
				out.println("<script>");
				out.println("alert('장바구니 담기 성공')");
				out.println("location.href='cart.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('장바구니 담기 실패')");
				out.println("histroy.back()");
				out.println("</script>");
			}
		}
	}

	@RequestMapping("cart_reset.do")
	public void cart_reset(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 로그인한 회원은 회원 아이디로, 로그인 하지 않았으면 손님 아이디로
		String user_id = (String) session.getAttribute("loginId");
		if (user_id == null) user_id = "guest";

		int check = this.dao.emptyCheck(user_id);

		if (check > 0) { // 장바구니에 상품이 있는 경우
			int result = this.dao.resetCart(user_id);

			if (result > 0) {
				out.println("<script>");
				out.println("location.href='cart.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('장바구니 비우기 실패')");
				out.println("histroy.back()");
				out.println("</script>");
			}
		}
	}

}
