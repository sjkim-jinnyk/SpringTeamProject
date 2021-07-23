package com.spring.model;

import lombok.Data;

@Data
public class CouponOwnDTO {

	private int own_coupon;			
	private String own_mem;			
	private String own_check;		
	private int count;
	
	public CouponOwnDTO() { } 		// 기본생성자
	
	public CouponOwnDTO(int couponCount) {
		
		this.count = couponCount;
	}

}


