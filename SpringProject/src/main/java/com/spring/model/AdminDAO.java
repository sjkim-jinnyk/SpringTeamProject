package com.spring.model;

import java.util.List;

public interface AdminDAO {

	public int getListCount();			// 전체 회원 수를 확인하는 메서드
	public List<AdminDTO> getMemberList(PageDTO dto); //전체 회원을호출
	public AdminDTO getMemberdetail(int no);	// 회원 상세 내역 호출 

	public List<AdminDTO> adminSearchList(PageDTO dto); // 검색 리스트
	public int adminSearchMemberListCount(String keyword);	// 검색 게시글
		

	
	// :::::::::::::::::::::::::::상품관련:::::::::::::::::::::::::::::::::

	List<CateDTO> getCateList();				// 상품 카테고리 조회
	public int insertProduct(ProductDTO dto); 	// 상품 등록
	public int updateProduct(ProductDTO dto); 	// 상품 수정
	public int deletProduct(int no); 			// 상품 삭제
}
