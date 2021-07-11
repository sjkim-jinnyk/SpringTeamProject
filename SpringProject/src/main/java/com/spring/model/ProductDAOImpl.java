package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getProductListCount() {
		
		return this.sqlSession.selectOne("productTotalRecord");
	}

	@Override
	public List<ProductDTO> getProductList(PageDTO dto) {

		return this.sqlSession.selectList("productList", dto);
	}

	@Override
	public ProductDTO getProductCont(int no) {
		
		return this.sqlSession.selectOne("productCont", no);
	}

	@Override
	public int getReviewListCount(int no) {
		
		return this.sqlSession.selectOne("proReviewTotalRecord", no);
	}

	@Override
	public List<ReviewDTO> getReviewList(PageDTO dto) {
		
		return this.sqlSession.selectList("proReviewList", dto);
	}

	@Override
	public int getProQnaListCount(int no) {
		
		return this.sqlSession.selectOne("proQnaTotalRecord", no);
	}

	@Override
	public List<QnaDTO> getProQnaList(PageDTO dto) {
		
		return this.sqlSession.selectList("proQnaList", dto);
	}

	@Override
	public int getTotalStar(int no) {
		
		return this.sqlSession.selectOne("totalStar", no);
	}

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
