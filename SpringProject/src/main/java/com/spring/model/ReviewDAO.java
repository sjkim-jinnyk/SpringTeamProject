package com.spring.model;

import java.util.List;

public interface ReviewDAO {
	
	public int getReivewListCount();
	public List<ReviewDTO> getReviewList(PageDTO dto);
	public ReviewDTO getReviewCont(int no);
	
}
