package com.spring.model;

public interface ProductLikeDAO {

	public int checkLike(ProductLikeDTO dto);				// 찜목록에 상품이 있는지 확인
	public int addLike(ProductLikeDTO dto);					// 찜목록에 추가
	public int removeLike(ProductLikeDTO dto);				// 찜목록에서 제거
	
	
}
