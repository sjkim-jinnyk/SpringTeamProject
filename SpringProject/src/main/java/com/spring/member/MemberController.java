package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.CouponDTO;
import com.spring.model.CouponOwnDTO;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;
import com.spring.model.MyPageHeader;
import com.spring.model.OrderDTO;
import com.spring.model.OrderDeliverDTO;
import com.spring.model.OrderDetailDTO;
import com.spring.model.ProductDAO;
import com.spring.model.ProductDTO;
import com.spring.model.ProductLikeDTO;
import com.spring.model.ProductRecentDAO;
import com.spring.model.ProductRecentDTO;
import com.spring.model.QnaCategoryDTO;
import com.spring.model.QnaDTO;
import com.spring.model.ReviewDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private ProductRecentDAO prdao;

	@RequestMapping("test.do")
	public String test(Model model) {

		List<MemberDTO> list = this.dao.getMemberList();

		model.addAttribute("List", list);

		return "member/test";
	}

	// ajax
	@RequestMapping("member_order.do")
	@ResponseBody
	public String memcheck(@RequestParam("id") String id) {

		MemberDTO mdto = this.dao.getMemberInfo(id);
		System.out.println("통신" + mdto.getMem_regdate().substring(0, 10));

		return mdto.getMem_regdate().substring(0, 10);
	}

	// 마이페이지 home
	@RequestMapping("member_home.do")
	public String home(HttpSession session, Model model) {

		String id = (String) session.getAttribute("session_id");

		MemberDTO mdto = this.dao.getMemberInfo(id); // id에 해당하는 회원 정보

		List<OrderDeliverDTO> oddto = this.dao.getOrderDeliverList(); // 배송 정보
		List<ProductDTO> proinfo = new ArrayList<ProductDTO>();

		List<OrderDTO> odto = this.dao.getOrderList(id); // id에 해당하는 주문 정보
		if (odto != null) {
			List<OrderDetailDTO> detail = this.dao.getOrderDetail(odto);
			proinfo = this.dao.getProductInfo(detail);
		}

		MyPageHeader mypage = new MyPageHeader();
		mypage.setPoint(mdto.getMem_point());
		mypage.setMemId(mdto.getMem_id());
		mypage.setMemName(mdto.getMem_name());

		// id에 해당하는 쿠폰 수
		int coupon = this.dao.couponCount(id);
		CouponOwnDTO countCoupon = new CouponOwnDTO(coupon);
		mypage.setCouponCount(countCoupon.getCount());

		// id에 해당하는 리뷰 수
		int review = this.dao.reviewCount(id);
		ReviewDTO reviewcount = new ReviewDTO(review);
		mypage.setReviewCount(reviewcount.getReviewCount());

		// id에 해당하는 찜 수
		int like = this.dao.likeCount(id);
		ProductLikeDTO ldto = new ProductLikeDTO(like);
		mypage.setLikeCount(ldto.getLikeCount());

		session.setAttribute("myPage", mypage);

		model.addAttribute("Order", odto);
		model.addAttribute("Deliver", oddto);
		model.addAttribute("Detail", proinfo);

		return "member/member_home";
	}

	// 주문내역 검색 조회
	@RequestMapping("order_search.do")
	public String memberOrderSearch(HttpSession session, Model model, @RequestParam("orderFirst") String orderFirst,
			@RequestParam("orderLast") String orderLast) {

		String id = (String) session.getAttribute("session_id");

		// 검색 날짜를 map에 저장하여 넘겨주기
		Map map = new HashMap();
		map.put("first", orderFirst);
		map.put("last", orderLast);
		map.put("id", id);

		List<OrderDTO> olist = this.dao.getOrderSearchList(map);
		List<OrderDetailDTO> detail = this.dao.getOrderDetail(olist);
		List<ProductDTO> proinfo = this.dao.getProductInfo(detail);

		List<OrderDeliverDTO> oddto = this.dao.getOrderDeliverList(); // 배송 정보
		List<OrderDeliverDTO> oddto_search = this.dao.getOrderDeliverList(); // 배송 정보

		MemberDTO dto = this.dao.getMemberInfo(id);

		model.addAttribute("OrderSearchList", olist);
		model.addAttribute("Deliver ", oddto);
		model.addAttribute("DeliverS", oddto_search);
		model.addAttribute("map", map);
		model.addAttribute("Detail", proinfo);
		return "member/member_home";
	}

	// 주문 상세내역
	@RequestMapping("order_detail.do")
	public String detail(HttpSession session, Model model, @RequestParam("no") int no) {

		String id = (String) session.getAttribute("session_id");

		MemberDTO dto = this.dao.getMemberInfo(id);

		OrderDTO order = this.dao.orderDetail(no);
		OrderDetailDTO prono = this.dao.orderProno(no);
		CouponDTO couponCont = this.dao.couponCont(order.getCoupon_no());

		ProductDTO product = this.dao.getQnaProductInfo(prono.getOrder_pro_no());

		model.addAttribute("Order", order);
		model.addAttribute("Product", product);
		model.addAttribute("CouponCont", couponCont);

		return "member/member_orderDetail";
	}

	// 쿠폰 페이지
	@RequestMapping("member_coupon.do")
	public String coupon(HttpSession session, Model model) {

		String id = (String) session.getAttribute("session_id");

		MemberDTO mdto = this.dao.getMemberInfo(id);
		List<CouponOwnDTO> codto = this.dao.getCouponList(id);
		List<CouponDTO> cdto = new ArrayList<CouponDTO>();

		if (!codto.isEmpty()) {
			cdto = this.dao.getCouponInfo(codto);
		}

		model.addAttribute("CouponInfo", cdto);

		return "member/member_coupon";
	}

	// 리뷰 페이지
	@RequestMapping("member_review.do")
	public String review(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");

		MemberDTO mdto = this.dao.getMemberInfo(id);
		List<OrderDTO> odto = this.dao.getOrderList(id); // id에 해당하는 주문 정보

		List<OrderDetailDTO> oddto = this.dao.getOrderDetail(odto); // Order 테이블의 주문번호로 주문상세내역 찾기

		List<ProductDTO> pdto = this.dao.getProductInfo(oddto); // 주문상세내역의 제품번호로 제품 정보 찾기

		List<ReviewDTO> rdto = this.dao.getReviewList(id); // id에 해당하는 리뷰 정보 찾기

		model.addAttribute("ProductInfo", pdto);
		model.addAttribute("OrderDetail", oddto);
		model.addAttribute("OrderInfo", odto);
		model.addAttribute("ReviewList", rdto);

		return "member/member_review";
	}

	// 리뷰 검색
	@RequestMapping("review_search.do")
	public String review_search(HttpSession session, Model model, @RequestParam("orderFirst") String orderFirst,
			@RequestParam("orderLast") String orderLast) {
		String id = (String) session.getAttribute("session_id");

		// 검색 날짜를 map에 저장하여 넘겨주기
		Map map = new HashMap();
		map.put("first", orderFirst);
		map.put("last", orderLast);
		map.put("id", id);

		List<OrderDTO> odto = this.dao.getOrderList(id); // id에 해당하는 주문 정보
		List<ReviewDTO> review = this.dao.getReviewSearchList(map);
		List<OrderDetailDTO> oddto = this.dao.getOrderDetail_review(review); // 리뷰 테이블의 주문번호로 주문상세내역 찾기

		List<ProductDTO> pdto = this.dao.getProductInfo(oddto); // 주문상세내역의 제품번호로 제품 정보 찾기

		model.addAttribute("ProductInfo_s", pdto);
		model.addAttribute("OrderDetail_s", oddto);
		model.addAttribute("Order_s", odto);
		model.addAttribute("ReviewList_s", review);
		model.addAttribute("map", map);

		return "member/member_review";
	}

	// 리뷰 내용
	@RequestMapping("member_review_cont.do")
	public String review_cont(HttpSession session, @RequestParam("no") int no, Model model) {

		ReviewDTO rdto = this.dao.getReviewCont(no);

		model.addAttribute("ReviewCont", rdto);

		return "member/member_review_cont";
	}

	// 리뷰 작성
	@RequestMapping("member_review_write.do")
	public String review_write(HttpSession session, @RequestParam("no") int no, Model model) {

		ReviewDTO rdto = this.dao.getReviewCont(no);

		model.addAttribute("ReviewWrite", rdto);

		return "member/member_review_test";
	}

	@RequestMapping("member_review_wrtie_ok.do")
	public void review_write_ok(ReviewDTO dto, @RequestParam("order_no") int order_no,
			@RequestParam("review_star") int review_star, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.updateReview(dto);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 등록 성공')");
			out.println("location.href='member_review_cont.do?no=" + order_no + "'");
			out.println("</script>");
		} else {
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
		List<ProductDTO> plist = new ArrayList<ProductDTO>();

		if (!plList.isEmpty()) {
			plist = this.dao.getProductLikeInfo(plList);
		}

		model.addAttribute("ProductLikeInfo", plist);

		return "member/member_productLike";
	}

	// 찜 취소 페이지
	@RequestMapping("productLike_delete.do")
	public void productLikeDelte(@RequestParam("no") int no, @RequestParam("id") String id,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.deleteProductLike(no);
		if (check > 0) {
			out.println("<script>");
			out.println("location.href='member_productLike.do?id=" + id + "'");
			out.println("</script>");
		}
	}

	// 회원 정보 & 수정
	@RequestMapping("member_info.do")
	public String memberInfoUpdate(HttpSession session, Model model) {

		String id = (String) session.getAttribute("session_id");

		MemberDTO dto = this.dao.getMemberInfo(id);

		model.addAttribute("Cont", dto);

		return "member/member_info";
	}

	// 회원 비밀번호 수정
	@RequestMapping("member_pwd_edit.do")
	public void memberPwdUpdate(HttpSession session, MemberDTO dto, HttpServletResponse response,
			@RequestParam("db_pwd") String db_pwd, @RequestParam("before_pwd") String before_pwd) throws IOException {
		String id = (String) session.getAttribute("session_id");

		dto.setMem_id(id);
		System.out.println(dto.getMem_id());
		System.out.println(dto.getMem_pwd());
		System.out.println(db_pwd);
		System.out.println(before_pwd);
		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();
		if(db_pwd.equals(before_pwd)) { 
			int check = this.dao.updateMemberPwd(dto);
			if(check > 0) {
				out.println("<script>");
				out.println("location.href='member_info.do?id=" + dto.getMem_id() + "'");
				out.println("</script>"); 
			}else { 
				out.println("<script>");
				out.println("history.back()");
				out.println("</script>"); 
			} 
		}else {
			out.println("<script>");
			out.println("alert('현재 비밀번호 입력을 잘 못 하셨습니다. 확인해주세요')");
			out.println("history.back()"); 
			out.println("</script>"); 
		}
		 
	}
	// 회원 주소 수정
	@RequestMapping("member_addr_edit.do")
	public void memberAddrUpdate(MemberDTO dto, @RequestParam("mem_addr1") String mem_addr1,
			@RequestParam("mem_addr2") String mem_addr2, HttpServletResponse response) throws IOException {

		String mem_addr = mem_addr1 + " " + mem_addr2;
		System.out.println("mem 주소 : " + mem_addr);

		dto.setMem_addr(mem_addr);

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.updateMemberAddr(dto);
		if (check > 0) {
			out.println("<script>");
			out.println("location.href='member_info.do?id=" + dto.getMem_id() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	// 회원 연락처 수정
	@RequestMapping("member_phone_edit.do")
	public void memberPhoneUpdate(MemberDTO dto, @RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3, HttpServletResponse response)
			throws IOException {

		String mem_phone = phone1 + "-" + phone2 + "-" + phone3;
		dto.setMem_phone(mem_phone);
		System.out.println("mem dto : " + dto);

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.updateMemberPhone(dto);

		if (check > 0) {
			out.println("<script>");
			out.println("location.href='member_info.do?id=" + dto.getMem_id() + "'");
			out.println("</script>");
		} else {
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

		model.addAttribute("Cont", dto);

		return "member/member_delete";
	}

	// 회원 삭제
	@RequestMapping("member_delete_ok.do")
	public void memberDeleteOk(HttpSession session, MemberDTO dto, @RequestParam("db_pwd") String db_pwd,
			HttpServletResponse response, @RequestParam("agreeC") int agree) throws IOException {
		String id = (String) session.getAttribute("session_id");

		System.out.println("삭제 비번 : " + dto.getMem_pwd());
		System.out.println("삭제 db 비번 : " + db_pwd);
		response.setContentType("text/html; charset-UTF-8");
		
		System.out.println(agree);
		PrintWriter out = response.getWriter();
		
		if(agree == 1) {
			if(dto.getMem_pwd().equals(db_pwd)) {
				int check = this.dao.deleteMember(id);
				
				if(check > 0) {
					out.println("<script>");
					out.println("alert('성공')");
					out.println("location.href='main.do'");
					out.println("</script>");
				}
			}else {
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다. 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {
			out.println("<script>");
			out.println("alert('회원탈퇴 동의 후 회원탈퇴를 하실 수 있습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

	// 문의내역 페이지
	@RequestMapping("member_qna.do")
	public String memberQnA(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		String admin = "admin";

		List<QnaDTO> list = this.dao.getQnaList(id);
		List<QnaDTO> reply = this.dao.getQnaList(admin); // 관리자 답글

		List<ProductDTO> plist = new ArrayList<ProductDTO>();
		List<QnaCategoryDTO> qclist = new ArrayList<QnaCategoryDTO>();

		for (int i = 0; i < list.size(); i++) {
			plist.add(this.dao.getQnaProductInfo(list.get(i).getQna_pro()));
			qclist.add(this.dao.getQnaCateList(list.get(i).getQna_category_no()));
		}
		System.out.println("reply : " + reply);
		model.addAttribute("qnaList", list);
		model.addAttribute("reply", reply);
		model.addAttribute("qnaProductList", plist);
		model.addAttribute("qnaCategory", qclist);
		return "member/member_qna";
	}

	// 문의내역 상세 페이지
	@RequestMapping("qna_cont.do")
	public String qnaCont(HttpSession session, Model model, @RequestParam("no") int qna_no) {

		QnaDTO qdto = this.dao.getQnaContList(qna_no);
		System.out.println("qncContList : " + qdto);
		System.out.println("qnc번호 : " + qna_no);

		// 답글 list
		List<QnaDTO> reply = this.dao.getQnaReplyList(qna_no);
		System.out.println("qncReply : " + reply);

		model.addAttribute("QnaCont", qdto);
		model.addAttribute("QnaReply", reply);

		return "member/member_qnaCont";
	}

	// 최근 본 상품
	@RequestMapping("member_recent.do")
	public String memberRecent(HttpSession session, Model model) {

		String id = (String) session.getAttribute("session_id");

		int check = this.prdao.recentCheck(id); // 최근 본 상품 여부 확인

		if (check > 0) { // 최근 본 상품이 있는 경우
			List<ProductRecentDTO> list = this.prdao.getRecentList(id);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).getProductDTO().tag_split();
			}
			model.addAttribute("list", list);
		}

		return "member/member_recent";
	}
	
	@RequestMapping("member_sns.do")
	public String memberSNS(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("session_id");
		
		MemberDTO dto = this.dao.getMemberInfo(id);
		
		model.addAttribute("MemberSns", dto);
		System.out.println(dto);
		return "member/member_sns";
	}

}
