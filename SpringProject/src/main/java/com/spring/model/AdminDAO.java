package com.spring.model;

import java.util.HashMap;
import java.util.List;

public interface AdminDAO {

	int getListCount();

	List<AdminDTO> getMemberList(PageDTO dto);

	int searchMemberListCount(HashMap<String, String> hm);
	List<AdminDTO>searchMemberList(PageDTO dto);
	
	
	
	
	// ::::::::::::::::::::::상품 관련:::::::::::::::::::::::::::
	public List<CateDTO> getCateList();								// 상품 카테고리 조회
	public CateDTO getProductCate(int no);							// 상품별 카테고리 조회
	public int insertCategory(CateDTO dto);							// 새로운 카테고리 등록
	public int updateCate(CateDTO dto);								// 카테고리 수정
	public int deleteCate(int no);									// 카테고리 삭제
	
	public int getProductAllListCount();							// 전체 상품 수 조회
	public List<ProductDTO> getProductAllList(PageDTO dto);			// 전체 상품 리스트 조회
	
	public int insertProduct(ProductDTO dto); 						// 상품 등록
	public int updateProduct(ProductDTO dto);						// 상품 수정
	public int updateProductNoImg(ProductDTO dto);					// 상품 이미지를 제외한 수정
	public int deleteProduct(int no); 								// 상품 삭제
	

	

}
