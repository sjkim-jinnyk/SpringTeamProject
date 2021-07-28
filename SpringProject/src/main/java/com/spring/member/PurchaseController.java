package com.spring.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.model.CartDAO;
import com.spring.model.CartDTO;
import com.spring.model.CouponDTO;
import com.spring.model.CouponOwnDTO;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;
import com.spring.model.OrderDAO;
import com.spring.model.OrderDTO;
import com.spring.model.OrderDetailDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.ReviewDAO;
import com.spring.model.ReviewDTO;

@Controller
public class PurchaseController {
	
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private OrderDAO orderDAO;
	
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
	
	// 결제 성공 후 주문 단계
	@RequestMapping("/order.do")
	public String order(HttpSession session, HttpServletRequest request) {
		
		System.out.println("주문성공");
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("session_mem");	// ID 세션값 확인
		
		// 새 주소지 입력했을 때 받아줄 파라미터
		String new_name = request.getParameter("new_name");
		System.out.println("이름 : " + new_name);
		String new_phone = request.getParameter("new_phone");
		
		String temp1 = request.getParameter("new_zip");
		int new_zip = 0;	// null은 parseInt 했을 경우 오류가 발생해서 기본값0을 줌
		if (temp1 != "") {
			new_zip = Integer.parseInt(temp1);
		}
		String new_addr = request.getParameter("new_addr");
		String new_addr_detail = request.getParameter("new_addr_detail");
		new_addr = new_addr + new_addr_detail;
		
		// 주문 상세내역 받아주는 파라미터
		String cont = request.getParameter("cont");
		String temp2 = request.getParameter("coupon_no");
		int coupon_no = 0;	// null은 parseInt 했을 경우 오류가 발생해서 기본값0을 줌
		if (temp2 != "") {
			coupon_no = Integer.parseInt(temp2);
		}
		int price = Integer.parseInt(request.getParameter("price"));
		int rdDeliverDay = Integer.parseInt(request.getParameter("rdDeliverDay"));
		int rdDeliverTerm = Integer.parseInt(request.getParameter("rdDeliverTerm"));
		
		// 회원정보와동일, 새로입력 구분
		int rdAddrSetMod = Integer.parseInt(request.getParameter("rdAddrSetMod"));
		
		// 주문번호 할당
		int count = this.orderDAO.countOrderNo();
		int order_no = 1;
		if (count > 0) {
			order_no = this.orderDAO.setOrderNo();
		}

		// 주문내역 입력
		int check1 = 0;
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrder_no(order_no);
		orderDTO.setOrder_mem_id(memberDTO.getMem_id());
		orderDTO.setOrder_content(cont);
		orderDTO.setCoupon_no(coupon_no);
		orderDTO.setOrder_price(price);
		orderDTO.setOption_day(rdDeliverDay);
		orderDTO.setOption_term(rdDeliverTerm);
		if (rdAddrSetMod == 0) {
			orderDTO.setOrder_mem_name(memberDTO.getMem_name());
			orderDTO.setOrder_mem_phone(memberDTO.getMem_phone());
			orderDTO.setOrder_zip(memberDTO.getMem_zip());
			orderDTO.setOrder_addr(memberDTO.getMem_addr());
		} else if (rdAddrSetMod == 1) {
			orderDTO.setOrder_mem_name(new_name);
			orderDTO.setOrder_mem_phone(new_phone);
			orderDTO.setOrder_zip(new_zip);
			orderDTO.setOrder_addr(new_addr);	
		}
		
		check1 = this.orderDAO.insertOrder(orderDTO);
		
		if (check1 == 0) {
			System.out.println("주문내역 입력 실패");
		} else if (check1 >= 1) {
			System.out.println("주문내역 입력 성공");
		}
		
		// 리뷰번호 할당
		int rcount = this.orderDAO.countReviewNo();
		int review_no = 1;
		if (rcount > 0) {
			review_no = this.orderDAO.setReviewNo();
		}
				
		// 주문 상세내역, 리뷰 입력
		int check2 = 0;
		List<CartDTO> clist = this.cartDAO.getCartList(memberDTO.getMem_id());
		
		for (CartDTO cartDTO : clist) {
			// 주문내역 DTO
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
			orderDetailDTO.setOrder_no(order_no);
			orderDetailDTO.setOrder_pro_no(cartDTO.getProduct_no());
			orderDetailDTO.setOrder_pro_amount(cartDTO.getCart_amount());
			System.out.println("주문 상세내역 : " + orderDetailDTO);
			
			// 리뷰 DTO
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setReview_no(review_no);
			reviewDTO.setReview_pro(cartDTO.getProduct_no());
			reviewDTO.setReview_writer(memberDTO.getMem_id());
			reviewDTO.setOrder_no(order_no);
			
			// DB에 입력
			check2 += this.orderDAO.insertOrderDetail(orderDetailDTO);
			check2 += this.orderDAO.insertReview(reviewDTO);
			
			// 리뷰번호 증가
			review_no += 1;
		}
		
		if (check2 == 0) {
			System.out.println("주문 상세내역, 리뷰 입력 실패");
		} else if (check2 >= 1) {
			System.out.println("주문 상세내역, 리뷰 입력 성공");
		}
		
		
		// 주문 배송상태 입력
		int check3 =0;
		
		check3 = this.orderDAO.insertOrderDeliver(order_no);
		
		if (check3 == 0) {
			System.out.println("주문 배송상태 입력 실패");
		} else if (check3 >= 1) {
			System.out.println("주문 배송상태 입력 성공");
		}
		
		// 사용한 쿠폰 수정
		int check4 = 0;
		
		if (coupon_no != 0) {
			CouponOwnDTO couponOwnDTO = new CouponOwnDTO();
			couponOwnDTO.setOwn_coupon(coupon_no);
			couponOwnDTO.setOwn_mem(memberDTO.getMem_id());
			
			check4 = this.orderDAO.updateCouponOwn(couponOwnDTO);
			
			if (check4 == 0) {
				System.out.println("쿠폰 수정 실패");
			} else if (check4 >= 1) {
				System.out.println("쿠폰 수정 성공");
			}
		}
		
		// 카트 비우기
		int check5 = 0;
		
		check5 = this.orderDAO.deleteAllCart(memberDTO.getMem_id());
		
		if (check5 == 0) {
			System.out.println("카트 비우기 실패");
		} else if (check5 >= 1) {
			System.out.println("카트 비우기 성공");
		}
		
		return "cart/paySuccess";
		
	}
	
	@RequestMapping("/paySuccess.do")
	public String paySuccess() {
		
		return "cart/paySuccess";
	}
	
	@RequestMapping("/payFail.do")
	public String payFail() {
		
		return "cart/payFail";
	}
	
	// 쿠폰 팝업창 띄우는 매핑
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
