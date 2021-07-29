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
		return this.sqlSession.insert("memberAdd", dto);
	}

	@Override
	public int idCheck(String id) {
		return this.sqlSession.selectOne("idCheck", id);
	}

	@Override
	public String findId(String phone) {
		return this.sqlSession.selectOne("findId", phone);
	}

	@Override
	public String findPwd(String id) {
		return this.sqlSession.selectOne("findPwd", id);
	}

	@Override
	public MemberDTO id_overlap(MemberDTO dto) {
		return this.sqlSession.selectOne("id_overlap", dto);
	}

	@Override
	public MemberDTO phone_overlap(MemberDTO dto) {
		return this.sqlSession.selectOne("phone_overlap", dto);
	}

	@Override
	public void getCoupon(String id) {
		this.sqlSession.insert("getCoupon", id);
	}

}
