
package com.spring.model;

import java.util.List;

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

	
	// 주문번호로 주문 정보 호출 메서드
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



}

