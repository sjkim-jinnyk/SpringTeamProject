package com.spring.model;

import java.util.List;

public interface ProductDAO {

	public int getProductListCount();						// 전체 상품 리스트 수를 조회하는 메서드
	public List<ProductDTO> getProductList(PageDTO dto);	// 전체 상품 리스트를 조회하는 메서드
	public ProductDTO getProductCont(int no);				// 특정 상품 상제 정보를 조회하는 메서드
	
	// review
	public int getReviewListCount(int no);
	public List<ReviewDTO> getReviewList(PageDTO dto);
	public int getTotalStar(int no);
	
	// qna
	public int getProQnaListCount(int no);
	public List<QnaDTO> getProQnaList(PageDTO dto);
	
	// cart
	public List<ProductDTO> getMemCart(List<Integer> list);
	public List<CartDTO> getCartList(String id);
	public int addCart(CartDTO dto);
	public int checkCart(CartDTO dto);
	public int updateAmount(CartDTO dto);
	
}
