package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getReivewListCount() {
		return this.sqlSession.selectOne("review_count");
	}

	@Override
	public List<ReviewDTO> getReviewList(PageDTO dto) {
		return this.sqlSession.selectList("review_list", dto);
	}

	@Override
	public ReviewDTO getReviewCont(int no) {
		return this.sqlSession.selectOne("review_cont", no);
	}
	
}
