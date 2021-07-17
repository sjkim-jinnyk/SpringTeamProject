package com.spring.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("count");
	}

	@Override
	public List<AdminDTO> getMemberList(PageDTO dto) {
		
		return this.sqlSession.selectList("adminList", dto);
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletProduct(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int searchMemberListCount(HashMap<String, String> hm) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AdminDTO> searchMemberList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}


}
