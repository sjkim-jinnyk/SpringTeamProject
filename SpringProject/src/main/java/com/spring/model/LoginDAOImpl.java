package com.spring.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int naverJoinCheck(HashMap<String, String> id) {
		
		return this.sqlSession.selectOne("naverJoinCheck", id);
	}

	@Override
	public int snsJoin(MemberDTO dto) {
		
		return this.sqlSession.insert("snsJoin", dto);
	}
}
