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
		
		return this.sqlSession.insert("insertProduct", dto);
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		
		return this.sqlSession.update("updateProduct", dto);
	}

	@Override
	public int deleteProduct(int no) {
		
		return this.sqlSession.delete("deleteProduct", no);
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

	@Override
	public List<CateDTO> getCateList() {
		
		return this.sqlSession.selectList("cateList");
	}

	@Override
	public int getProductAllListCount() {
		
		return this.sqlSession.selectOne("proAllListCount");
	}

	@Override
	public List<ProductDTO> getProductAllList(PageDTO dto) {
		 
		return this.sqlSession.selectList("proAllList", dto);
	}

	@Override
	public CateDTO getProductCate(int no) {
		
		return this.sqlSession.selectOne("productCate", no);
	}

	@Override
	public int updateProductNoImg(ProductDTO dto) {
		
		return this.sqlSession.update("updateProductNoImg", dto);
	}

	@Override
	public int insertCategory(CateDTO dto) {
		 
		return this.sqlSession.insert("insertCate", dto);
	}
	
	@Override
	public int updateCate(CateDTO dto) {
		
		return this.sqlSession.update("updateCate", dto);
	}

	@Override
	public int deleteCate(int no) {
		 
		return this.sqlSession.delete("deleteCate", no);
	}

	


}
