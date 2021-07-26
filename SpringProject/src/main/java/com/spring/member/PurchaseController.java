package com.spring.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.BoardDTO;
import com.spring.model.CartDAO;
import com.spring.model.CartDTO;
import com.spring.model.CouponDTO;
import com.spring.model.CouponOwnDTO;
import com.spring.model.MemberDAO;
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
	@Autowired
	private MemberDAO memberDAO;
	
	// 결제 페이지 진입 매핑
	@RequestMapping("/purchase.do")
	public String purchase(HttpSession session, Model model) throws IOException {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("session_mem");	// ID 세션값 확인
		System.out.println("세션 id : " + memberDTO.getMem_id());
		
		List<CartDTO> clist = this.cartDAO.getCartList(memberDTO.getMem_id());	// 카트 목록 확인
		System.out.println("clist : " + clist);
		System.out.println("clist.size : " + clist.size());
		
		System.out.println("제품번호 : " + clist.get(0).getProduct_no());
		System.out.println("제품수량 : " + clist.get(0).getCart_amount());
		
		int totalPrice = 0;
		for (int i = 0; i < clist.size(); i++) {	// 총 가격 계산
			ProductDTO dto = this.productDAO.getProductCont(clist.get(i).getProduct_no());
			totalPrice += dto.getPro_output_price() * clist.get(i).getCart_amount();
		}
		
		// order_content에 넣을 수 있게 변형
		ProductDTO productDTO = this.productDAO.getProductCont(clist.get(0).getProduct_no());	
		System.out.println("제품 이름 : " + productDTO.getPro_name());
		
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
	
	@RequestMapping("/order.do")
	public String order(HttpSession session, HttpServletRequest request) {
		
		System.out.println("주문성공");
		
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		return "cart/paySuccess";
		
	}
	
	@RequestMapping("/paySuccess.do")
	public String paySuccess(HttpSession session, HttpServletRequest request) {
		
		return "cart/paySuccess";
	}
	
	@RequestMapping("/payFail.do")
	public String payFail() {
		
		return "cart/payFail";
	}
	
	@RequestMapping("/coupon_popup.do")
	public String coupon_popup(HttpSession session, Model model) {

		String id = (String) session.getAttribute("session_id");

		List<CouponOwnDTO> codto = this.memberDAO.getCouponList(id);
		List<CouponDTO> cdto = new ArrayList<CouponDTO>();

		if (!codto.isEmpty()) {
			cdto = this.memberDAO.getCouponInfo(codto);
		}

		model.addAttribute("CouponInfo", cdto);
		
		return "cart/coupon_popup";
	}

}
