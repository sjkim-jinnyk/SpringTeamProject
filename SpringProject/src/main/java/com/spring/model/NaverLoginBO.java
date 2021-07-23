package com.spring.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.security.SecureRandom;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

	private final static String CLIENT_ID = "c9lvgts6cYnpgXL4xlvY"; // 발급받은 클라이언트 ID
	private final static String CLIENT_SECRET = "tsZoLZQS7G"; // 발급받은 클라이언트 secret
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me"; // 프로필 조회 API URL
	private final static String DELETE_URL = "https://nid.naver.com/oauth2.0/token?grant_type=delete";

	public String getAuthorizationUrl(HttpSession session, String callback_URL) {

		// 세션 유효성 검증을 위하여 난수 생성 후 session 에 저장. 
		String state = generateRandomString();
		setSession(session, state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		// url 형식 = 네아로에서 제공하는 인증 url + client_id + client_secret
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(callback_URL).state(state) 
				.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String callback_URL) throws IOException {
	
		// 세션 유효성 검증
		String sessionState = getSession(session);	
		if (StringUtils.pathEquals(sessionState, state)) {
			// json 형식으로 생성된 callback 메시지에서 accessToken만 파싱
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
					.callback(callback_URL).state(state).build(NaverLoginApi.instance());
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
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

	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken, String callback_URL) throws IOException {
		
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(callback_URL).build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
		return response.getBody();
	}

	// access_token 을 이용하여 네이버 연동 해제
	// 네이버 자체에서 직접적인 연동 해제는 안 되므로 원한다면 개인이 직접 해야 함. (네이버-내정보-보안설정-네이버와 연결된 서비스 관리)
	public String deleteToken(String access_token) {
		
		return UriComponentsBuilder.fromUriString(DELETE_URL)
				.queryParam("response_type", "delete").queryParam("client_id", CLIENT_ID)
				.queryParam("client_secret", CLIENT_SECRET).queryParam("access_token", access_token)
				.queryParam("service_provider", "NAVER").build().toString();
	}

}
