package com.spring.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countOrderNo() {
		
		return this.sqlSession.selectOne("채ㅕㅜㅅOrderNo");
	}
	
	@Override
	public int setOrderNo() {
		
		return this.sqlSession.selectOne("setOrderNo");
	}
	
	@Override
	public int insertOrder(OrderDTO dto) {
		
		return this.sqlSession.insert("insertOrder", dto);
	}

	@Override
	public int insertOrderDetail(OrderDetailDTO dto) {
		
		return this.sqlSession.insert("insertOrderDetail", dto);
	}

	@Override
	public int insertOrderDeliver(int order_no) {
		
		return this.sqlSession.insert("insertOrderDeliver", order_no);
	}

	@Override
	public int deleteAllCart(String id) {
		
		return this.sqlSession.delete("deleteAllCart", id);
	}

	@Override
	public int updateCouponOwn(CouponOwnDTO dto) {
		
		return this.sqlSession.update("updateCouponOwn", dto);
	}

	
	
}
