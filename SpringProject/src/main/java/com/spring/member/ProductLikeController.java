package com.spring.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.ProductLikeDAO;
import com.spring.model.ProductLikeDTO;

@Controller
public class ProductLikeController {

	@Autowired
	private ProductLikeDAO dao;
	
	@RequestMapping("add_like.do")
	@ResponseBody
	public int add_like(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		
		int result = 0;
		
		int product_no = Integer.parseInt(request.getParameter("no"));
		
		String user_id = (String) session.getAttribute("session_id");
		if(user_id == null) {
			user_id = "guest";
		}
		
		ProductLikeDTO dto = new ProductLikeDTO();
		dto.setLike_mem(user_id);
		dto.setLike_product(product_no);

		int likeCheck = this.dao.checkLike(dto);
		
		if(likeCheck == 0) {
			result = (this.dao.addLike(dto) > 0) ? 1 : 0;		// 찜목록에 추가 성공하면 1 반환
		}else {
			int res = this.dao.removeLike(dto);
			result = (res > 0) ? 2 : 0;				// 찜목록에서 삭제 성공하면 2 반환
		}
		
		return result;
	}
}
