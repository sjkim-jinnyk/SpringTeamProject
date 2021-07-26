package com.spring.model;

import java.util.HashMap;

public interface LoginDAO {

	// 네이버 로그인	
	public int snsJoinCheck(HashMap<String, String> hm);			// sns id로 가입된 정보 여부 확인
	public int snsJoin(MemberDTO dto);								// sns id로 가입
	public MemberDTO getSnsMemInfo(HashMap<String, String> hm);		// sns id로 회원 이름 조회
	public int deleteSnsID(String id);								// 회원 정보에서 sns 연동(sns_type, sns_id) 삭제
	public int addSnsID(HashMap hm);								// 회원 정보에 sns 연동(sns_type, sns_id) 추가
	public int snsConnectCheck(HashMap hm);
	
}
