package com.spring.model;

import java.util.List;

public interface MemberDAO {

	public List<MemberDTO> getMemberList();									// 전체 회원 리스트 호출 메서드
		
	public List<OrderDeliverDTO> getOrderDeliverList();						// 전체 회원 배송 리스트 호출 메서드
	
	public List<OrderDTO> getOrderList(String id);							// 특정 회원 주문 리스트 호출 메서드
	
	public MemberDTO getMemberInfo(String id);								// 특정 회원 정보 호출 메서드	
	
	public int couponCount(String id);										// 특정 회원 쿠폰 수 호출 메서드
	
	public int reviewCount(String id);										// 특정 회원 리뷰 수 호출 메서드
	
	public int likeCount(String id);										// 특정 회원 찜 수 호출 메서드
	
	public List<CouponOwnDTO> getCouponList(String id);						// 특정 회원 쿠폰 리스트 호출 메서드
	
	public List<CouponDTO> getCouponInfo(List<CouponOwnDTO> list); 			// 쿠폰 내역 호출 메서드
	
	public List<OrderDetailDTO> getOrderDetail(List<OrderDTO> list); 		// 주문번호로 주문 정보 호출 메서드
	
	public List<ProductDTO> getProductInfo(List<OrderDetailDTO> list);		// 주문번호로 제품 정보 호출 메서드
	
	public List<ReviewDTO> getReviewList(String id);						// 제품번호로 리뷰 리스트 호출 메서드
	
	public ReviewDTO getReviewCont(int no);									// 리뷰번호로 리뷰 상세내역 호출 메서드
	
	public int updateReview(ReviewDTO dto);   								// 리뷰 수정 메서드

	public List<ProductLikeDTO> getProductLikeList(String id);				// id로 찜한 상품 리스트 호출 메서드
	
	public int deleteProductLike(int no);									// 찜한 상품 취소
	
	public List<ProductDTO> getProductLikeInfo(List<ProductLikeDTO> list);	// 찜한 상품 리스트의 정보 호출 메서드
	
	public int updateMemberAddr(MemberDTO dto);								// 회원 주소 수정 메서드
		
	public int updateMemberPhone(MemberDTO dto);							// 회원 연락처 수정 메서드
	
	public int deleteMember(String id);										// 회원 삭제  메서드
	
	public List<QnaDTO> getQnaList(String id);								// id에 해당하는 리뷰리스트 호출 메서드
}
