package com.spring.model;

import java.util.List;

public interface MemberDAO {

	public List<OrderDTO> getOrderList(MemberDTO dto);  // 주문내역 호출 메서드
	

}
