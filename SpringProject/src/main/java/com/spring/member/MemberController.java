package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.ProductLikeDTO;
import com.spring.model.QnaCategoryDTO;
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
	
	// 마이페이지 home 
	@RequestMapping("member_home.do")
	public String home(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("session_id");

		MemberDTO mdto = this.dao.getMemberInfo(id);	// id에 해당하는 회원 정보
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
	
	// 쿠폰 페이지
	@RequestMapping("member_coupon.do")
	public String coupon(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO mdto = this.dao.getMemberInfo(id);		
		List<CouponOwnDTO> codto = this.dao.getCouponList(id);
		
		List<CouponDTO> cdto = this.dao.getCouponInfo(codto);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO rdto = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", rdto);
		model.addAttribute("Like", ldto);
		model.addAttribute("CouponInfo", cdto);
		
		return "member/member_coupon";
	}
	
	// 리뷰 페이지
	@RequestMapping("member_review.do")
	public String review(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO mdto = this.dao.getMemberInfo(id);	
		List<OrderDTO> odto = this.dao.getOrderList(id);	// id에 해당하는 주문 정보
		
		List<OrderDetailDTO> oddto = this.dao.getOrderDetail(odto); // Order 테이블의 주문번호로 주문상세내역 찾기
		
		List<ProductDTO> pdto = this.dao.getProductInfo(oddto); // 주문상세내역의 제품번호로 제품 정보 찾기
		
		List<ReviewDTO> rdto = this.dao.getReviewList(id);	// id에 해당하는 리뷰 정보 찾기
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("ProductInfo", pdto);
		model.addAttribute("OrderDetail", oddto);
		model.addAttribute("OrderInfo", odto);
		model.addAttribute("ReviewList", rdto);
		
		return "member/member_review";
	}
	
	// 리뷰 내용
	@RequestMapping("member_review_cont.do")
	public String review_cont(HttpSession session, @RequestParam("no") int no, Model model) {
		
		ReviewDTO rdto = this.dao.getReviewCont(no);
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO mdto = this.dao.getMemberInfo(id);	
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("ReviewCont", rdto);
		
		return "member/member_review_cont";
	}
	
	// 리뷰 작성
	@RequestMapping("member_review_write.do")
	public String review_write(HttpSession session, @RequestParam("no") int no, Model model) {
		
		ReviewDTO rdto = this.dao.getReviewCont(no);
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO mdto = this.dao.getMemberInfo(id);	
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
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
	public String productLike(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		
		List<ProductLikeDTO> plList = this.dao.getProductLikeList(id);
		List<ProductDTO> plist = this.dao.getProductLikeInfo(plList);
		
		MemberDTO mdto = this.dao.getMemberInfo(id);	
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Cont", mdto);
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("ProductLikeInfo", plist);
		
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
	
	// 주문내역 조회
	@RequestMapping("member_orderList.do")
	public String memberOrder(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		
		return "member/member_order";
	}
	
	// 주문내역 검색 조회
	@RequestMapping("order_search.do")
	public String memberOrderSearch(HttpSession session, Model model, @RequestParam("orderFirst") String orderFirst, @RequestParam("orderLast") String orderLast) {
		
		String id = (String) session.getAttribute("session_id");
		
		Map map = new HashMap();
		map.put("first", orderFirst);
		map.put("last", orderLast);
		map.put("id", id);
		System.out.println("map" + map);
		
		List<OrderDTO> olist = this.dao.getOrderSearchList(map);
		System.out.println("olist : " + olist);
		
		List<OrderDeliverDTO> oddto = this.dao.getOrderDeliverList(); // 배송 정보
		System.out.println("배송정보 : " + oddto);
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		model.addAttribute("OrderSearchList", olist);
		model.addAttribute("Deliver ", oddto);
		return "member/member_order";
	}

	// 회원 정보 & 수정
	@RequestMapping("member_info.do")
	public String memberInfoUpdate(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		
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
	
	// 회원 탈퇴 페이지
	@RequestMapping("member_info_delete.do")
	public String memberDelete(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");

		MemberDTO dto = this.dao.getMemberInfo(id);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		
		
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		
		return "member/member_delete";
	}
	
	// 회원 삭제 
	@RequestMapping("member_delete_ok.do")
	public void memberDeleteOk(HttpSession session, MemberDTO dto, @RequestParam("db_pwd") String db_pwd, HttpServletResponse response) throws IOException {
		String id = (String) session.getAttribute("session_id");
		
		System.out.println("삭제 비번 : " + dto.getMem_pwd());
		System.out.println("삭제 db 비번 : " + db_pwd);
		
		if(dto.getMem_pwd().equals(db_pwd)){

			response.setContentType("text/html; charset-UTF-8");
			PrintWriter out = response.getWriter();

			int check = this.dao.deleteMember(id);

			if(check > 0) {
				out.println("<script>");
				out.println("alert('성공')");
				out.println("location.href='main.do'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}
	
	// 문의내역 페이지
	@RequestMapping("member_qna.do")
	public String memberQnA(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		
		List<QnaDTO> list = this.dao.getQnaList(id);
		List<ProductDTO> plist = new ArrayList<ProductDTO>(); 
		List<QnaCategoryDTO> qclist = new ArrayList<QnaCategoryDTO>();
		
		for(int i=0; i<list.size(); i++) {
			plist.add(this.dao.getQnaProductInfo(list.get(i).getQna_pro()));
			qclist.add(this.dao.getQnaCateList(list.get(i).getQna_category_no()));
		}
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
	
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		model.addAttribute("qnaList", list);
		model.addAttribute("qnaProductList", plist);
		model.addAttribute("qnaCategory", qclist);
		System.out.println("문의내역 상품 리스트 : " + plist);
		System.out.println("문의 카테고리 : " + qclist);
		System.out.println("문의내역 리스트 : " + list);
		
		return "member/member_qna";
	}
	
	// 문의내역 상세 페이지
	@RequestMapping("qna_cont.do")
	public String qnaCont(HttpSession session, Model model, @RequestParam("no") int qna_no) {
		String id = (String) session.getAttribute("session_id");
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		QnaDTO qdto = this.dao.getQnaContList(qna_no);
		System.out.println("qncContList : " + qdto);
		System.out.println("qnc번호 : " + qna_no);
		
		// 답글 list
		List<QnaDTO> reply = this.dao.getQnaReplyList(qna_no);
		System.out.println("qncReply : " + reply);
		
		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);	
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		
		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);	
		ReviewDTO reviewcount = new ReviewDTO(review);
		
		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);		
		ProductLikeDTO ldto = new ProductLikeDTO(like);
	
		model.addAttribute("Coupon", countCoupon);
		model.addAttribute("Review", reviewcount);
		model.addAttribute("Like", ldto);
		model.addAttribute("Cont", dto);
		model.addAttribute("QnaCont", qdto);
		model.addAttribute("QnaReply", reply);
		
		return "member/member_qnaCont";
	}
}
