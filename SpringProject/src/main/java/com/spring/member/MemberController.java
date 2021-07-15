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

import com.spring.model.CouponDTO;
import com.spring.model.CouponOwnDTO;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;
import com.spring.model.OrderDTO;
import com.spring.model.OrderDeliverDTO;
import com.spring.model.OrderDetailDTO;
import com.spring.model.ProductDTO;
import com.spring.model.ProductLikeDTO;
import com.spring.model.QnaDTO;
import com.spring.model.ReviewDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("test.do")
	public String test(Model model) {
		
		List<MemberDTO> list = this.dao.getMemberList();
		
		model.addAttribute("List", list);
		
		return "member/test";
	}
	
	@RequestMapping("member_home.do")
	public String home(@RequestParam("id") String id, Model model) {
		

		
		MemberDTO mdto = this.dao.getMemberInfo(id);		// id에 해당하는 회원 정보
		List<OrderDTO> odto = this.dao.getOrderList(id);	// id에 해당하는 주문 정보
		List<OrderDeliverDTO> oddto = this.dao.getOrderDeliverList(); // 배송 정보
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO cdto = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO rdto = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", cdto);
		model.addAttribute("Review", rdto);
		model.addAttribute("Like", ldto);
		model.addAttribute("Order", odto);
		model.addAttribute("Deliver", oddto);
		
		return "member/member_home";
	}
	
	@RequestMapping("member_coupon.do")
	public String coupon(@RequestParam("id") String id, Model model) {
		
		MemberDTO mdto = this.dao.getMemberInfo(id);		
		List<CouponOwnDTO> codto = this.dao.getCouponList(id);
		
		List<CouponDTO> cdto = this.dao.getCouponInfo(codto);
		
		model.addAttribute("CouponInfo", cdto);
		model.addAttribute("Member", mdto);
		
		return "member/member_coupon";
	}
	
	@RequestMapping("member_review.do")
	public String review(@RequestParam("id") String id, Model model) {
		
		MemberDTO mdto = this.dao.getMemberInfo(id);	
		List<OrderDTO> odto = this.dao.getOrderList(id);	// id에 해당하는 주문 정보
		
		List<OrderDetailDTO> oddto = this.dao.getOrderDetail(odto); // Order 테이블의 주문번호로 주문상세내역 찾기
		
		List<ProductDTO> pdto = this.dao.getProductInfo(oddto); // 주문상세내역의 제품번호로 제품 정보 찾기
		
		List<ReviewDTO> rdto = this.dao.getReviewList(id);	// id에 해당하는 리뷰 정보 찾기
		
		model.addAttribute("ProductInfo", pdto);
		model.addAttribute("OrderDetail", oddto);
		model.addAttribute("OrderInfo", odto);
		model.addAttribute("ReviewList", rdto);
		
		return "member/member_review";
	}
	
	@RequestMapping("member_review_cont.do")
	public String review_cont(@RequestParam("no") int no, Model model) {
		
		ReviewDTO rdto = this.dao.getReviewCont(no);
		
		model.addAttribute("ReviewCont", rdto);
		
		return "member/member_review_cont";
	}
	
	@RequestMapping("member_review_write.do")
	public String review_write(@RequestParam("no") int no, Model model) {
		
		ReviewDTO rdto = this.dao.getReviewCont(no);
		
		model.addAttribute("ReviewWrite", rdto);
		
		return "member/member_review_write";
	}

	@RequestMapping("member_review_wrtie_ok.do")
	public void review_write_ok(ReviewDTO dto, @RequestParam("order_no") int order_no, @RequestParam("review_star") int review_star, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset-UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateReview(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 등록 성공')");
			out.println("location.href='member_review_cont.do?no=" + order_no + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	// 찜 페이지
	@RequestMapping("member_productLike.do")
	public String productLike(@RequestParam("id") String id, Model model) {
		
		List<ProductLikeDTO> plList = this.dao.getProductLikeList(id);
		List<ProductDTO> plist = this.dao.getProductLikeInfo(plList);
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(id);
		
		model.addAttribute("ProductLikeInfo", plist);
		model.addAttribute("ProductLike", dto);
		
		return "member/member_productLike";
	}
	
	// 찜 취소 페이지
	@RequestMapping("productLike_delete.do")
	public void productLikeDelte(@RequestParam("no") int no, @RequestParam("id") String id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset-UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteProductLike(no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('찜 삭제 성공')");
			out.println("location.href='member_productLike.do?id=" + id + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('찜 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	

	// 회원 정보 & 수정
	@RequestMapping("member_info.do")
	public String memberInfoUpdate(@RequestParam("id") String id, Model model) {
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		model.addAttribute("memberInfo", dto);
		
		return "member/member_info";
	}
	
	
	// 회원 주소 수정
	@RequestMapping("member_addr_edit.do")
	public void memberAddrUpdate(MemberDTO dto, @RequestParam("mem_addr1") String mem_addr1, @RequestParam("mem_addr2") String mem_addr2, HttpServletResponse response) throws IOException {
		
		String mem_addr = mem_addr1 + " " + mem_addr2;
		System.out.println("mem 주소 : " + mem_addr);
		
		
		dto.setMem_addr(mem_addr);
		
		response.setContentType("text/html; charset-UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateMemberAddr(dto);
		if(check > 0) {
			out.println("<script>");
			out.println("location.href='member_info.do?id=" + dto.getMem_id() + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	// 회원 연락처 수정
	@RequestMapping("member_phone_edit.do")
	public void memberPhoneUpdate(MemberDTO dto, @RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2,  @RequestParam("phone3") String phone3, HttpServletResponse response) throws IOException {
		
		String mem_phone = phone1 + "-" + phone2 + "-" +phone3;
		dto.setMem_phone(mem_phone);
		System.out.println("mem dto : " + dto);
		
		response.setContentType("text/html; charset-UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateMemberPhone(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("location.href='member_info.do?id=" + dto.getMem_id() + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("member_info_delete.do")
	public String memberDelete(@RequestParam("id") String id, Model model) {
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		model.addAttribute("memberInfo", dto);
		
		return "member/member_delete";
	}
	
	@RequestMapping("member_delete_ok.do")
	public void memberDeleteOk(MemberDTO dto, @RequestParam("db_pwd") String db_pwd, HttpServletResponse response) throws IOException {
		
		if(dto.getMem_pwd().equals(db_pwd)) {
			
			response.setContentType("text/html; charset-UTF-8");
			PrintWriter out = response.getWriter();
			
			int check = this.dao.deleteMember(dto.getMem_id());
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('성공')");
				out.println("location.href='home.jsp'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
	}
	
	
	// 문의내역
	@RequestMapping("member_qna.do")
	public String memberQnA(@RequestParam("id") String id, Model model) {
		
		List<QnaDTO> list = this.dao.getQnaList(id);
		
		model.addAttribute("qnaList", list);
		
		return "member/member_qna";
	}
}
