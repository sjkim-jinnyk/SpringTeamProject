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
	public AdminDTO getMemberdetail(int no) {
		
		return this.sqlSession.selectOne("admincont", no);
	}

	public List<CateDTO> getCateList() {
		
		return this.sqlSession.selectList("cateList");
	}

	@Override 
	public List<AdminDTO> adminSearchList(PageDTO dto) {
	 
	 return this.sqlSession.selectList("adminSearchList", dto); 
	 }


	@Override
	public int adminSearchMemberListCount(String keyword) {
		
		return this.sqlSession.selectOne("adminSearchListCount", keyword);
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

	@Override
	public int getProductSearchListCount(HashMap<String, String> hm) {
		
		return this.sqlSession.selectOne("proSearchListCount", hm);
	}

	@Override
	public List<ProductDTO> getProductSearchList(PageDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("proSearchList", dto);
	}

	@Override
	public List<Admin_QNADTO> getQnaList(PageDTO dto) {
		
		return this.sqlSession.selectList("admin_qnaList", dto);
	}

	@Override
	public Admin_QNADTO getQnainquiry(int no) {
	
		return this.sqlSession.selectOne("qnaInquiry", no);
	}

	@Override
	public int getCouponCount() {
		
		return this.sqlSession.selectOne("coupon_count");
	}
	
	@Override
	public List<Admin_CouponDTO> getAdminCouponList(PageDTO dto) {
		
		return this.sqlSession.selectList("admin_couponlist", dto);
	}

	@Override
	public int Create_Coupon(Admin_CouponDTO dto) {
	
		return this.sqlSession.insert("admin_create_coupon", dto);
	}



}
