package com.spring.model;

import java.util.List;

public interface MemberDAO {

	public List<MemberDTO> getMemberList();	
	public List<OrderDTO> getOrderList(String id);
	public MemberDTO getMemberInfo(String id);
	public int couponCount(String id);
	public int reviewCount(String id);
	public int likeCount(String id);
	public List<OrderDeliverDTO> getOrderDeliverList(OrderDTO dto);
	public OrderDTO getOrderInfo(String id);		// id에 해당하는 주문내역 호출 메서드
}
