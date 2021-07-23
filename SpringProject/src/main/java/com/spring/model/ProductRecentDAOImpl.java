package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRecentDAOImpl implements ProductRecentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int addRecent(ProductRecentDTO dto) {

		return this.sqlSession.insert("addRecent", dto);
	}

	@Override
	public List<ProductRecentDTO> getRecentList(String id) {
		
		return this.sqlSession.selectList("recentList", id);
	}

	@Override
	public int recentCheck(String id) {
		
		return this.sqlSession.selectOne("recentCheck", id);
	}

	@Override
	public int recentProCheck(ProductRecentDTO dto) {
		
		return this.sqlSession.selectOne("recentProCheck", dto);
	}

	@Override
	public void updateRecentPro(ProductRecentDTO dto) {
		
		this.sqlSession.update("updateRecentPro", dto);
	}

	@Override
	public int deleteRecent(ProductRecentDTO dto) {
		
		return this.sqlSession.delete("deleteRecent", dto);
	}

}
