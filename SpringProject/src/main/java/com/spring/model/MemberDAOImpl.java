
package com.spring.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 전체 회원 리스트 호출 메서드
	@Override
	public List<MemberDTO> getMemberList() {

		return this.sqlSession.selectList("memberList");
	}
	
	// 특정 회원 주문 리스트 호출 메서드
	@Override
	public List<OrderDTO> getOrderList(String id) {

		return this.sqlSession.selectList("orderList", id);
	}
	
	// 주문날짜로 주문리스트 호출 메서드
	@Override
	public List<OrderDTO> getOrderSearchList(Map map) {

		return this.sqlSession.selectList("orderSearchList", map);
	}
	
	// 특정 회원 정보 호출 메서드	
	@Override
	public MemberDTO getMemberInfo(String id) {

		return this.sqlSession.selectOne("content", id);
	}

	// 특정 회원 쿠폰 수 호출 메서드
	@Override
	public int couponCount(String id) {

		return this.sqlSession.selectOne("couponCount", id);
	}
	
	// 특정 회원 리뷰 수 호출 메서드
	@Override
	public int reviewCount(String id) {
		
		return this.sqlSession.selectOne("reviewCount", id);
	}

	// 특정 회원 찜 수 호출 메서드
	@Override
	public int likeCount(String id) {
		
		return this.sqlSession.selectOne("likeCount", id);
	}

	// 전체 회원 배송 리스트 호출 메서드
	@Override
	public List<OrderDeliverDTO> getOrderDeliverList() {

		return this.sqlSession.selectList("deliverList");
	}

	// 특정 회원 쿠폰 리스트 호출 메서드
	@Override
	public List<CouponOwnDTO> getCouponList(String id) {

		return this.sqlSession.selectList("couponList", id);
	}

	// 쿠폰 번호에 해당하는 쿠폰 정보 호출 메서드
	@Override
	public List<CouponDTO> getCouponInfo(List<CouponOwnDTO> list) {

		return this.sqlSession.selectList("couponInfo", list);
	}
	
	// 쿠폰 번호에 해당하는 쿠폰 상세 내역 조회
	@Override
	public CouponDTO couponCont(int no) {

		return this.sqlSession.selectOne("couponCont", no);
	}
	// 주문번호로 주문 상세내역 호출 메서드
	@Override
	public OrderDTO orderDetail(int no) {

		return this.sqlSession.selectOne("noOrderDetail", no);
	}
	
	// 주문번호로 제품 번호 조회
	@Override
	public OrderDetailDTO orderProno(int no) {

		return this.sqlSession.selectOne("orderProNO", no);
	}
	// 주문번호로 주문 정보 호출 메서드(list 안 주문번호)
	@Override
	public List<OrderDetailDTO> getOrderDetail(List<OrderDTO> list) {

		return this.sqlSession.selectList("orderDetail", list);
	}

	// 주문번호로 제품 정보 호출 메서드
	@Override
	public List<ProductDTO> getProductInfo(List<OrderDetailDTO> list) {

		return this.sqlSession.selectList("productInfo", list);
	}
	
	// 제품 번호로 리뷰 리스트 호출 메서드
	@Override
	public List<ReviewDTO> getReviewList(String id) {
		
		return this.sqlSession.selectList("reviewList", id);
	}

	
	// 리뷰번호로 리뷰 상세내역 호출 메서드
	@Override
	public ReviewDTO getReviewCont(int no) {

		return this.sqlSession.selectOne("reviewCont", no);
	}

	
	// 리뷰 추가 메서드
	@Override
	public int updateReview(ReviewDTO dto) {
		
		return this.sqlSession.insert("updateReview", dto);
	}

	
	// id를 통해 찜한 상품 리스트 호출 메서드
	@Override
	public List<ProductLikeDTO> getProductLikeList(String id) {

		return this.sqlSession.selectList("productLikeList", id);
	}
	
	// 찜한 상품 취소
	@Override
	public int deleteProductLike(int no) {

		return this.sqlSession.delete("deleteProductLike", no);
	}


	// 찜한 상품 정보 호출 메서드
	@Override
	public List<ProductDTO> getProductLikeInfo(List<ProductLikeDTO> list) {
		
		return this.sqlSession.selectList("productLikeInfo", list);
	}

	// 회원 정보 수정 메서드
	@Override
	public int updateMemberAddr(MemberDTO dto) {

		return this.sqlSession.update("updateMemberAddr", dto);
	}
	
	// 회원 연락처 수정 메서드
	@Override
	public int updateMemberPhone(MemberDTO dto) {
		
		return this.sqlSession.update("updateMemberPhone", dto);
	}

	// 회원 삭제 메서드
	@Override
	public int deleteMember(String id) {

		return this.sqlSession.delete("deleteMember", id);
	}

	// id에 해당하는 qna 리스트 호출 메서드
	@Override
	public List<QnaDTO> getQnaList(String id) {
		
		return this.sqlSession.selectList("qnaList", id);
	}

	// qna 정보로 상품정보 호출 메서드
	@Override
	public ProductDTO getQnaProductInfo(int pro_no) {

		return this.sqlSession.selectOne("qnaProductInfo", pro_no);
	}

	// qna list의 카테고리 번호에 해당하는 카테고리 정보 호출 메서드
	@Override
	public QnaCategoryDTO getQnaCateList(int cate_no) {
		
		return this.sqlSession.selectOne("qnaCategorList", cate_no);
	}

	// qna 그룹번호에 해당하는 qna 리스트 호출 메서드
	@Override
	public QnaDTO getQnaContList(int qna_no) {

		return this.sqlSession.selectOne("qnaContList", qna_no);
	}

	@Override
	public List<QnaDTO> getQnaReplyList(int qna_no) {

		return this.sqlSession.selectList("qnaReplyList", qna_no);
	}













	








}

