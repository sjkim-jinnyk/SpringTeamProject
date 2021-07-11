package com.spring.model;

import lombok.Data;

@Data
public class ProductRecentDTO {

	private int recent_no;
	private String recent_mem;
	private int recent_product;
	private String recent_regdate;
	
	private ProductDTO productDTO; 
}
