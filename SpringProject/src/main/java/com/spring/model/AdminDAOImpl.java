package com.spring.model;

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
		
		return this.sqlSession.insert("insertProduct", dto);
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
	public AdminDTO getMemberdetail(int no) {
		
		return this.sqlSession.selectOne("admincont", no);
	}

	public List<CateDTO> getCateList() {
		
		return this.sqlSession.selectList("cateList");
	}


	@Override public List<AdminDTO> adminSearchList(PageDTO dto) {
	 
	 return this.sqlSession.selectList("searchList", dto); 
	 }


	@Override
	public int adminSearchMemberListCount(String keyword) {
		
		return this.sqlSession.selectOne("searchListCount", keyword);
	}




}
