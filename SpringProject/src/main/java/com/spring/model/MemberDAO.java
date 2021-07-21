package com.spring.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	public List<MemberDTO> getMemberList();									// 전체 회원 리스트 호출 메서드
	
	public List<OrderDetailDTO> getOrderDetail(List<OrderDTO> list); 		// 주문번호로 주문 정보 호출 메서드
	public List<ProductDTO> getProductInfo(List<OrderDetailDTO> list);		// 주문번호로 제품 정보 호출 메서드
	public List<OrderDetailDTO> getOrderDetail_review(List<ReviewDTO> list);// 주문번호로 제품 정보 호출 메서드
	
	// mypage home_header
	public MemberDTO getMemberInfo(String id);								// 특정 회원 정보 호출 메서드	
	public int couponCount(String id);										// 특정 회원 쿠폰 수 호출 메서드
	public int reviewCount(String id);										// 특정 회원 리뷰 수 호출 메서드
	public int likeCount(String id);										// 특정 회원 찜 수 호출 메서드
	
	// mypage home 주문 내역
	public List<OrderDeliverDTO> getOrderDeliverList();						// 전체 회원 배송 리스트 호출 메서드
	public List<OrderDTO> getOrderList(String id);							// 특정 회원 주문 리스트 호출 메서드
	public List<OrderDTO> getOrderSearchList(Map map);						// 주문날짜로 주문내역 호출 
	public OrderDTO orderDetail(int no);									// 주문번호에 해당하는 주문 상세내역 조회
	public OrderDetailDTO orderProno(int no);								// 주문번호로 구매한 제품번호 조회
	
	// coupon 
	public List<CouponOwnDTO> getCouponList(String id);						// 특정 회원 쿠폰 리스트 호출 메서드
	public List<CouponDTO> getCouponInfo(List<CouponOwnDTO> list); 			// 쿠폰 내역 호출 메서드
	public CouponDTO couponCont(int no);									// 쿠폰 번호에 해당하는 쿠폰 내용 조회
	
	// review
	public List<ReviewDTO> getReviewList(String id);						// 제품번호로 리뷰 리스트 호출 메서드
	public ReviewDTO getReviewCont(int no);									// 리뷰번호로 리뷰 상세내역 호출 메서드
	public int updateReview(ReviewDTO dto);   								// 리뷰 수정 메서드
	public List<ReviewDTO> getReviewSearchList(Map map);					// 리뷰날짜로 리뷰내역 호출 
	
	// productLike
	public List<ProductLikeDTO> getProductLikeList(String id);				// id로 찜한 상품 리스트 호출 메서드
	public int deleteProductLike(int no);									// 찜한 상품 취소
	public List<ProductDTO> getProductLikeInfo(List<ProductLikeDTO> list);	// 찜한 상품 리스트의 정보 호출 메서드
	
	// 회원 정보 수정
	public int updateMemberAddr(MemberDTO dto);								// 회원 주소 수정 메서드
	public int updateMemberPhone(MemberDTO dto);							// 회원 연락처 수정 메서드
	
	// 회원 탈퇴
	public int deleteMember(String id);										// 회원 삭제  메서드
	
	// 문의내역
	public List<QnaDTO> getQnaList(String id);								// id에 해당하는 qna 리스트 호출 메서드
	public ProductDTO getQnaProductInfo(int pro_no);						// 주문번호로 제품 정보 호출 메서드
	public QnaCategoryDTO getQnaCateList(int cate_no);						// qna list의 카테고리 번호에 해당하는 카테고리 정보 호출 메서드
	public QnaDTO getQnaContList(int qna_no);								// qna 그룹번호에 해당하는 qna 리스트 호출 메서드
	public List<QnaDTO> getQnaReplyList(int qna_no);						// qna 그룹번호에 해당하는 관리자 답글 호출 메서드
	
}
