package com.spring.model;

import lombok.Data;

@Data
public class NaverOauthParams {
	
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String expires_in;

}
