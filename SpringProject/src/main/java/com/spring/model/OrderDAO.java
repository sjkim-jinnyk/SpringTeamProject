package com.spring.model;

public interface OrderDAO {
	
	public int setOrderNo();					// 추가할 주문번호 지정
	public int insertOrder(OrderDTO dto);				// 주문내역 추가
	public int insertOrderDetail(OrderDetailDTO dto);	// 주문 상세내역 추가
	public int insertOrderDeliver(int order_no);	// 주문 배송상태 추가
	public int deleteAllCart(String id);				// 장바구니 전체 상품 삭제
	public int updateCouponOwn(CouponOwnDTO dto);		// 쿠폰 상태 업데이트
	
}
