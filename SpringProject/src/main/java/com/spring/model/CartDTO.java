package com.spring.model;

import lombok.Data;

@Data
public class CartDTO {

	private int cart_no;
	private String user_id;
	private int product_no;
	private int cart_amount;
}
