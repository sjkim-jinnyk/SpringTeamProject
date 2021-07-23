package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class AdminDTO {
	
	private int mem_no;
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_phone;
	private int mem_zip;
	private String mem_addr;
	private int mem_point;
	private String mem_regdate;
	
}
