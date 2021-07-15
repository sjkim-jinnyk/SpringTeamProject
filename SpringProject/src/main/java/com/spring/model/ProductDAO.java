package com.spring.model;

import java.util.HashMap;
import java.util.List;

public interface ProductDAO {

	public int getProductListCount();						// 전체 상품 리스트 수를 조회하는 메서드
	public List<ProductDTO> getProductList(PageDTO dto);	// 전체 상품 리스트를 조회하는 메서드
	public ProductDTO getProductCont(int no);				// 특정 상품 상제 정보를 조회하는 메서드
	
	// review
	public int getReviewListCount(int no);					// 특정 상품에 관한 리뷰 수를 조회
	public List<ReviewDTO> getReviewList(PageDTO dto);		// 특정 상품에 관한 리뷰 리스트 조회
	public int getTotalStar(int no);						// 특정 상품에 관한 별점의 합
	public int getReviewPhotoCount(int no);					// 특정 상품에 관한 사진 리뷰 수
	public List<ReviewDTO> getReviewPhotoList(PageDTO dto);	// 특정 상품에 관한 사진 리슈 리스트
	
	// qna
	public int getProQnaListCount(int no);					// 특정 상품에 관한 문의 수
	public List<QnaDTO> getProQnaList(PageDTO dto);			// 특정 상품에 관한 문의 리스트
	public int insertProQna(QnaDTO dto);					// 특정 상품에 관한 문의글 작성
	public int deleteQna(int no);							// 문의글 삭제
	public QnaDTO getQnaCont(int no);						// 문의글 상세내역 조회
	public int updateProQna(QnaDTO dto);					// 문의글 수정
	public int insertProQnaAns(QnaDTO dto);					// 문의글 답변
	
	// search
	public List<ProductDTO> getSearchList(PageDTO dto);		// 검색 리스트
	public int getSearchListCount(String keyword);			// 검색된 게시글 수
	public int getSearchTagCount(String keyword);			// 태그 검색된 게시글 수
	public List<ProductDTO> getSearchTagList(PageDTO dto);	// 태그 검색 리스트
	
}
