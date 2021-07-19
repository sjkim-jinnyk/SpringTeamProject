package com.spring.model;

import java.util.HashMap;
import java.util.List;

public interface AdminDAO {

	int getListCount();

	List<AdminDTO> getMemberList(PageDTO dto);

	int insertProduct(ProductDTO dto); // 상품 등록

	int updateProduct(ProductDTO dto); // 상품 수정

	int deletProduct(int no); // 상품 삭제

	int searchMemberListCount(HashMap<String, String> hm);
	List<AdminDTO>searchMemberList(PageDTO dto);
	
	List<CateDTO> getCateList();			// 상품 카테고리 조회
	

	

}
