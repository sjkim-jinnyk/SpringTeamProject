package com.spring.model;

import java.util.HashMap;

public interface LoginDAO {

	// 네이버 로그인
	public int naverJoinCheck(HashMap<String, String> id);
	public int snsJoin(MemberDTO dto);

	
}
