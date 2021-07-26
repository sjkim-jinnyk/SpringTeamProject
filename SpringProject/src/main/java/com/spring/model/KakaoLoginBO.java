package com.spring.model;

import java.io.IOException;
import java.net.URI;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

public class KakaoLoginBO {

	private final static String REST_API_KEY = "1116ec4a39e7fe3de5f368d1dfbee3b2"; // 발급받은 클라이언트 ID
	private final static String SESSION_STATE = "oauth_state";
	
	private final static String BASE_URL = "https://kauth.kakao.com/oauth/authorize";
	private final static String TOKEN_API_URL = "https://kauth.kakao.com/oauth/token";
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me"; // 프로필 조회 API URL
	private final static String DELETE_URL = "https://kapi.kakao.com/v1/user/unlink";
	
	private String id;

	public String getAuthorizationUrl(HttpSession session, String callback_URL) {

		// 세션 유효성 검증을 위하여 난수 생성 후 session 에 저장. 
		String state = generateRandomString();
		setSession(session, state);
		
		return UriComponentsBuilder.fromUriString(BASE_URL).queryParam("response_type", "code").queryParam("client_id", REST_API_KEY)
				.queryParam("redirect_uri", callback_URL).queryParam("state", state).build().toString();
	}

	/* 카카오톡으로 Callback 처리 및 AccessToken 획득 Method */
	public String getAccessToken(HttpServletRequest request, String code, String callback_URL) throws IOException {
	
		String accessToken = "";

	    // restTemplate을 사용하여 API 호출
	    RestTemplate restTemplate = new RestTemplate();
	    URI uri = URI.create(TOKEN_API_URL);

	    HttpHeaders headers = new HttpHeaders();

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    parameters.set("grant_type", "authorization_code");
	    parameters.set("client_id", REST_API_KEY);
	    parameters.set("redirect_uri", callback_URL);
	    parameters.set("code", code);

	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();

	    accessToken = (String) responseBody.get("access_token");

	    return accessToken;
	}

	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	/* http session에 데이터 저장 */
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	/* http session에서 데이터 가져오기 */
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}

	/* Access Token을 이용하여 카카오 사용자 프로필 호출 */
	public String getUserProfile(String access_token, String callback_URL) throws IOException {
		
		String kakaoId = "";

	    RestTemplate restTemplate = new RestTemplate();
	    URI uri = URI.create(PROFILE_API_URL);

	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + access_token);
	    headers.set("KakaoAK", REST_API_KEY);

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    parameters.add("property_keys", "[\"id\"]");
	    //parameters.add("property_keys", "[\"properties.nickname\"]");

	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();

	    kakaoId = String.valueOf(responseBody.get("id"));
	    //String kakaoNick = String.valueOf(responseBody.get("properties.nickname"));
	    
	    this.id = kakaoId;
	    
		return kakaoId;
	}

	// access_token 을 이용하여 카카오 연동 해제
	public int deleteToken(String access_token) {
		
	    RestTemplate restTemplate = new RestTemplate();
	    URI uri = URI.create(DELETE_URL);

	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + access_token);

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();

	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();
	    
	    String id = String.valueOf(responseBody.get("id"));
	    
	    int result = 0;
	    
	    if(id.equals(this.id)) {
	    	result = 1;
	    }else {
	    	result = 0;
	    }
	    
	    return result;
	}

}
