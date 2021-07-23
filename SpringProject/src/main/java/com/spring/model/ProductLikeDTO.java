package com.spring.model;

import lombok.Data;

@Data
public class ProductLikeDTO {

	private int like_no;
	private String like_mem;
	private int like_product;
	private String like_regdate;
	private int likeCount;
	
	public ProductLikeDTO() { }  // 기본생성자
	public ProductLikeDTO(int likeCount) {
		
		this.likeCount = likeCount;
	}  
}
