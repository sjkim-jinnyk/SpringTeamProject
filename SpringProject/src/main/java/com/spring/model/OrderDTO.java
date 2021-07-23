package com.spring.model;

import lombok.Data;

@Data
public class OrderDTO {

	private int order_no;
	private String order_mem_id;
	private String order_mem_name;
	private String order_mem_phone;
	private int order_zip;
	private String order_addr;
	private String order_content;
	private int coupon_no;
	private int order_price;
	private String order_date;
	private int option_day;
	private int option_term;
	
	
}
