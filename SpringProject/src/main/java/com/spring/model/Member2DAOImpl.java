package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Member2DAOImpl implements Member2DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberDTO> getMemberList() {
		return this.sqlSession.selectList("list");
	}
	
	@Override
	public MemberDTO getMemberInfo(String id) {
		return this.sqlSession.selectOne("memberInfo", id);
	}
	
	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public int idCheck(String id) {
		return this.sqlSession.selectOne("idCheck", id);
	}

	@Override
	public int pwdCheck(String pwd) {
		return this.sqlSession.selectOne("pwdCheck", pwd);
	}

}
