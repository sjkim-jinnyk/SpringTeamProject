package com.spring.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getProductListCount(int no) {
		
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
	public List<ProductDTO> getSearchList(PageDTO dto) {
		
		return this.sqlSession.selectList("searchList", dto);
	}

	@Override
	public int getSearchListCount(String keyword) {
	
		return this.sqlSession.selectOne("searchListCount", keyword);
	}

	@Override
	public int getSearchTagCount(String keyword) {
		
		return this.sqlSession.selectOne("searchTagCount", keyword);
	}

	@Override
	public List<ProductDTO> getSearchTagList(PageDTO dto) {
		 
		return this.sqlSession.selectList("searchTagList", dto);
	}

	@Override
	public int getReviewPhotoCount(int no) {
		 
		return this.sqlSession.selectOne("proReviewPhotoCount", no);
	}

	@Override
	public List<ReviewDTO> getReviewPhotoList(PageDTO dto) {
		 
		return this.sqlSession.selectList("proReviewPhotoList", dto);
	}

	@Override
	public int insertProQna(QnaDTO dto) {
		
		return this.sqlSession.insert("writeProQna", dto);
	}

	@Override
	public int deleteQna(int no) {
		
		return this.sqlSession.delete("deleteQna", no);
	}

	@Override
	public QnaDTO getQnaCont(int no) {
		
		return this.sqlSession.selectOne("qnaCont", no);
	}

	@Override
	public int updateProQna(QnaDTO dto) {
		
		return this.sqlSession.update("updateProQna", dto);
	}

	@Override
	public int insertProQnaAns(QnaDTO dto) {
		
		return this.sqlSession.insert("proQnaAns", dto);
	}

	@Override
	public QnaDTO getProQnaAnswerList(int no) {
		
		return this.sqlSession.selectOne("proQnaAnsList", no);
	}

	@Override
	public String qnaGroupCount(int no) {

		return this.sqlSession.selectOne("qnaGroupCheck", no);
	}


	

}
