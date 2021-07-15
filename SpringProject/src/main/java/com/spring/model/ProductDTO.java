package com.spring.model;

import lombok.Data;

@Data
public class ProductDTO {
	
	private int pro_no;
	private String pro_name;
	private int pro_category;
	private int pro_input_price;
	private int pro_output_price;
	private String pro_tag;
	private String pro_check;
	private String pro_img;
	private String pro_cont;
	
	private String[] pro_tags;
	
	private int like_check;
	
	public void tag_split() {
		if(this.pro_tag != null) {
			this.pro_tags = pro_tag.split(",");
		}
	}
	
}
