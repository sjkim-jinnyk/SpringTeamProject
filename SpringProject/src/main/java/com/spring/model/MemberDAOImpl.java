package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<OrderDTO> getOrderList(String id) {

		return this.sqlSession.selectList("orderList", id);
	}

	@Override
	public MemberDTO getMemberInfo(String id) {

		return this.sqlSession.selectOne("content", id);
	}

	@Override
	public List<MemberDTO> getMemberList() {

		return this.sqlSession.selectList("memberList");
	}

	@Override
	public int couponCount(String id) {

		return this.sqlSession.selectOne("couponCount", id);
	}

	@Override
	public int reviewCount(String id) {
		
		return this.sqlSession.selectOne("reviewCount", id);
	}

	@Override
	public int likeCount(String id) {
		
		return this.sqlSession.selectOne("likeCount", id);
	}

	@Override
	public List<OrderDeliverDTO> getOrderDeliverList(OrderDTO dto) {

		return this.sqlSession.selectList("deliverList", dto);
	}

	@Override
	public OrderDTO getOrderInfo(String id) {
		
		return this.sqlSession.selectOne("1", id);
	}





	
}
