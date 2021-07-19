package com.spring.model;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URI;
import java.security.SecureRandom;

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

	private final static String CLIENT_ID = "c9lvgts6cYnpgXL4xlvY";	// 발급받은 클라이언트 ID
	private final static String CLIENT_SECRET = "tsZoLZQS7G";		// 발급받은 클라이언트 secret
	private final static String SESSION_STATE = "oauth_state";
	private final static String API_URL = "https://nid.naver.com/oauth2.0/authorize";					// 네아로 인증요청
	private final static String TOKEN_API_URL = "https://nid.naver.com/oauth2.0/token";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";				// 프로필 조회 API URL
	private final static String DELETE_URL = "https://nid.naver.com/oauth2.0/token?grant_type=delete";	// 인증 토큰 해지 API URL
	
	public String getLoginURI(HttpSession session, String callback_URI) {
		
	    String state = generateRandomString();
	    setSession(session, state);
		
		return UriComponentsBuilder.fromUriString(API_URL)
				.queryParam("response_type", "code").queryParam("client_id", CLIENT_ID).queryParam("redirect_uri", callback_URI).queryParam("state", state).build().toString();
	}
	
	public String getAccessToken(String code, String state) throws JsonParseException, JsonMappingException, IOException, ParseException {
		
		RestTemplate rt = new RestTemplate();
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded");
		
		MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
		param.add("grant_type", "authorization_code");
		param.add("client_id", CLIENT_ID);
		param.add("client_secret", CLIENT_SECRET);
		param.add("code", code);
		param.add("state", state);
		
		HttpEntity<MultiValueMap<String, String>> accessTokenRequest = new HttpEntity<MultiValueMap<String,String>>(param, headers);
		
		ResponseEntity<String> accessTokenResponse = rt.exchange(TOKEN_API_URL, HttpMethod.POST, accessTokenRequest, String.class);
		
		System.out.println(accessTokenResponse.getBody());
		
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(accessTokenResponse.getBody());
//		JSONObject jsonObj = (JSONObject) obj;
//		String access_token = (String) jsonObj.get("access_token");	
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		NaverOauthParams naverOauthParams = mapper.readValue(accessTokenResponse.getBody(), NaverOauthParams.class);
		
		HttpHeaders profile = new HttpHeaders();	
		
		profile.add("Authorization", "Bearer" + naverOauthParams.getAccess_token());
		
		HttpEntity<HttpHeaders> profileEntity = new HttpEntity<>(profile);
		
		RestTemplate rt2 = new RestTemplate();
		rt2.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		rt2.setErrorHandler(new DefaultResponseErrorHandler() {
			public boolean hasError(ClientHttpResponse response) throws IOException {
				HttpStatus statusCode = response.getStatusCode();
				return statusCode.series() == HttpStatus.Series.SERVER_ERROR;
			}
		});
		
		ResponseEntity<String> profileReponse = null;
		
		try {
		profileReponse = rt2.exchange(PROFILE_API_URL, HttpMethod.POST, profileEntity, String.class);
		//ResponseEntity<String> result = rt2.postForEntity(new URI(PROFILE_API_URL), profileEntity, String.class);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("access_token >> " + naverOauthParams.getAccess_token());
		System.out.println("result >> " + profileReponse.getBody());
		
		return profileReponse.getBody();
	}
	
//	public String getUserProfile(String accessToken) throws JsonParseException, JsonMappingException, IOException {
//
//		ObjectMapper mapper = new ObjectMapper();
//		RestTemplate rt = new RestTemplate();
//		
//		NaverLoginBO naverLoginBO = mapper.readValue(accessToken, NaverLoginBO.class);
//		
//		HttpHeaders profile = new HttpHeaders();
//		
//		profile.add("Authorization", "Bearer" + accessToken);
//		
//		HttpEntity<HttpHeaders> profileEntity = new HttpEntity<HttpHeaders>(profile);
//		
//		ResponseEntity<String> profileReponse = rt.exchange(PROFILE_API_URL, HttpMethod.POST, profileEntity, String.class);
//		
//		return profileReponse.getBody();
//	}
	
	
	

//	/* 네이버 아이디로 인증 URL 생성 Method */
//	public String getAuthorizationUrl(HttpSession session, String callback_URI) {
//		
//		/* 세션 유효성 검증을 위하여 난수를 생성 */
//		String state = generateRandomString(); 	//state: 애플리케이션이 생성한 상태 토큰
//		
//		/* 생성한 난수 값을 session에 저장 */
//		setSession(session, state);
//		
//		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
//		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
//				.callback(callback_URI).state(state) // 앞서 생성한 난수값을 인증 URL 생성시 사용
//				.build(NaverLoginApi.instance());
//		
//		return oauthService.getAuthorizationUrl();
//	}
//
	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String callback_URL) throws IOException {
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		if (StringUtils.pathEquals(sessionState, state)) {
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
		return new BigInteger(130, new SecureRandom()).toString();
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
	
	public String deleteToken(String ACCESS_TOKEN) {
		String deleteURL = DELETE_URL+"&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&access_token="+ACCESS_TOKEN+"&service_provider=NAVER";
		
		return deleteURL;
	}
}
