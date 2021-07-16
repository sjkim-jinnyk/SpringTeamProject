package com.spring.model;

import java.util.List;

public interface ProductRecentDAO {
	
	// recent
	public int addRecent(ProductRecentDTO dto);				// 최근 본 상품 추가
	public List<ProductRecentDTO> getRecentList(String id);	// 최근 본 상품 리스트
	public int recentCheck(String id);						// 최근 본 상품 수 조회
	public int recentProCheck(ProductRecentDTO dto);		// 최근 본 상품에 해당 상품이 있는지 조회
	public void updateRecentPro(ProductRecentDTO dto);		// 동일상품이 최근 본 상품에 있는 경우 조회일자 최신으로 변경
	public int deleteRecent(ProductRecentDTO dto);			// 최근 본 상품 삭제

}
