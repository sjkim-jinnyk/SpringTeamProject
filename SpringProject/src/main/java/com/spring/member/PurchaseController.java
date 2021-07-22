package com.spring.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.CartDAO;
import com.spring.model.CartDTO;
import com.spring.model.MemberDTO;
import com.spring.model.OrderDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;

@Controller
public class PurchaseController {
	
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/purchase.do")
	public String purchase(HttpSession session, Model model) throws IOException {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("session_mem");
		System.out.println("세션 id : " + memberDTO.getMem_id());
		
		List<CartDTO> clist = this.cartDAO.getCartList(memberDTO.getMem_id());
		System.out.println("clist : " + clist);
		System.out.println("clist.size : " + clist.size());
		
		System.out.println("제품번호 : " + clist.get(0).getProduct_no());
		System.out.println("제품수량 : " + clist.get(0).getCart_amount());
		
		ProductDTO productDTO = this.productDAO.getProductCont(clist.get(0).getProduct_no());
		System.out.println("제품 이름 : " + productDTO.getPro_name());
		
		int totalPrice = 0;
		for (int i = 0; i < clist.size(); i++) {
			ProductDTO dto = this.productDAO.getProductCont(clist.get(i).getProduct_no());
			totalPrice += dto.getPro_output_price() * clist.get(i).getCart_amount();
		}
		
		OrderDTO orderDTO = new OrderDTO();
		String orderCont = null;
		if (clist.size() == 1) {
			orderCont = productDTO.getPro_name() + " " + clist.get(0).getCart_amount() + "개";
			System.out.println("주문내역 : " + orderCont);
		} else if (clist.size() > 1) {
			orderCont = productDTO.getPro_name() + " " + clist.get(0).getCart_amount() + "개 외 " + (clist.size() - 1) + "종";
			System.out.println("주문내역 : " + orderCont);
		}
		
		orderDTO.setOrder_mem_name(memberDTO.getMem_name());
		orderDTO.setOrder_mem_phone(memberDTO.getMem_phone());
		orderDTO.setOrder_zip(memberDTO.getMem_zip());
		orderDTO.setOrder_addr(memberDTO.getMem_addr());
		orderDTO.setOrder_content(orderCont);
		orderDTO.setOrder_price(totalPrice);
		
		model.addAttribute("orderDTO", orderDTO);
		
		return "cart/purchase";
	}
	
	@RequestMapping("/paySuccess.do")
	public String paySuccess() {
		
		return "cart/paySuccess";
	}
	
	@RequestMapping("/payFail.do")
	public String payFail() {
		
		return "cart/payFail";
	}

}
