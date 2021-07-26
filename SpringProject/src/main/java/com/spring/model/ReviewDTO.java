package com.spring.model;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_no;
	private int review_pro;
	private String review_title;
	private String review_writer;
	private String review_cont;
	private String review_img;
	private int review_star;
	private int review_hit;
	private String review_date;
	private int reviewCount;
	private int order_no;
	
	public ReviewDTO() { } 		// 기본생성자
	
	public ReviewDTO(int reviewCount) {
		
		this.reviewCount = reviewCount;
		
	}
}
