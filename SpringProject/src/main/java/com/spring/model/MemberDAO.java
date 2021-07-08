package com.spring.model;

import java.util.List;

public interface MemberDAO {

	public List<MemberDTO> getMemberList();
	public List<OrderDTO> getOrderList(MemberDTO dto);
	public MemberDTO getMemberInfo(String id);
}
