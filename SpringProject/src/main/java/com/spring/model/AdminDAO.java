package com.spring.model;

import java.util.List;

public interface AdminDAO {

	int getListCount();

	List<AdminDTO> getMemberList(PageDTO dto);

	int insertProduct(ProductDTO dto); // 상품 등록

	int updateProduct(ProductDTO dto); // 상품 수정

	int deletProduct(int no); // 상품 삭제

	List<AdminDTO> searchMemberList(String field, String keyword);

}
