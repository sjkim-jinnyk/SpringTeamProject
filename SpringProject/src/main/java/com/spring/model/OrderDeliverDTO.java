package com.spring.model;

import lombok.Data;

@Data
public class OrderDeliverDTO {

	private int order_no;
	private String deliver_date;
	private int deliver_no;
	private int deliver_status;
	
}
