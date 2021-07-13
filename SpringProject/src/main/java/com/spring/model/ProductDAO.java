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
	
	// recent
	public int addRecent(ProductRecentDTO dto);				// 최근 본 상품 추가
	public List<ProductRecentDTO> getRecentList(String id);	// 최근 본 상품 리스트
	public int recentCheck(String id);						// 최근 본 상품 수 조회
	public int recentProCheck(ProductRecentDTO dto);		// 최근 본 상품에 해당 상품이 있는지 조회
	public void updateRecentPro(ProductRecentDTO dto);		// 동일상품이 최근 본 상품에 있는 경우 조회일자 최신으로 변경
	public int deleteRecent(ProductRecentDTO dto);			// 최근 본 상품 삭제
	
	// search
	public List<ProductDTO> getSearchList(PageDTO dto);		// 검색 리스트
	public int getSearchListCount(String keyword);			// 검색된 게시글 수
	public int getSearchTagCount(String keyword);			// 태그 검색된 게시글 수
	public List<ProductDTO> getSearchTagList(PageDTO dto);	// 태그 검색 리스트
	
	// like
	public int addLike(HashMap hm);							// 찜목록에 추가
	
}
