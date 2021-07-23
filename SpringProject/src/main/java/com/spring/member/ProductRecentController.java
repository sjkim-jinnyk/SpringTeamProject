package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.ProductRecentDAO;
import com.spring.model.ProductRecentDTO;

@Controller
public class ProductRecentController {

	@Autowired
	private ProductRecentDAO dao;
	

	@RequestMapping("product_recent.do")
	public String product_recent(HttpSession session, Model model) {

		String user_id = (String) session.getAttribute("session_id");
		if (user_id == null)
			user_id = "guest";

		int check = this.dao.recentCheck(user_id); // 최근 본 상품 여부 확인

		if (check > 0) { // 최근 본 상품이 있는 경우
			List<ProductRecentDTO> list = this.dao.getRecentList(user_id);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).getProductDTO().tag_split();
			}
			model.addAttribute("list", list);
		}

		return "product/product_recent";
	}

	@RequestMapping("recent_delete.do")
	public void recent_delete(@RequestParam("no") int no, HttpSession session, HttpServletResponse response,
			Model model) throws IOException {

		response.setContentType("text/html; UTF-8");
		PrintWriter out = response.getWriter();

		String user_id = (String) session.getAttribute("session_id");
		if (user_id == null)
			user_id = "guest";

		ProductRecentDTO dto = new ProductRecentDTO();
		dto.setRecent_product(no);
		dto.setRecent_mem(user_id);

		int result = this.dao.deleteRecent(dto);

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
