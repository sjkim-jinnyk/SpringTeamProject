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
	public List<OrderDTO> getOrderList(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO getMemberInfo(String id) {

		return this.sqlSession.selectOne("content", id);
	}

	@Override
	public List<MemberDTO> getMemberList() {

		return this.sqlSession.selectList("list");
	}



	
}
