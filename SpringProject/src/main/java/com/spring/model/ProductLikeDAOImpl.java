package com.spring.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductLikeDAOImpl implements ProductLikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkLike(ProductLikeDTO dto) {
		
		return this.sqlSession.selectOne("checkLike", dto);
	}
	
	@Override
	public int addLike(ProductLikeDTO dto) {

		return this.sqlSession.insert("addLike", dto);
	}

	@Override
	public int removeLike(ProductLikeDTO dto) {
		
		return this.sqlSession.delete("removeLike", dto);
	}

}
