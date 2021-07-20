package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.AudioFormat.Encoding;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.model.CartDAO;
import com.spring.model.LoginDAO;
import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;
import com.spring.model.NaverLoginBO;

@Controller
public class LoginController {

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private String callback_URL1 = "http://localhost:8585/member/naver_login.do";
	private String callback_URL2 = "http://localhost:8585/member/naver_connect.do";
	private String access_token;

	@Autowired
	private LoginDAO dao;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//	@RequestMapping("naver.do")
//	public void naver(HttpServletResponse response, HttpSession session) throws IOException {
//		
//		String uri = naverLoginBO.getLoginURI(session, callback_URL1);
//		System.out.println("uri >> " + uri);
//		response.sendRedirect(uri);
//	}
//	
//	@RequestMapping("naver_login.do")
//	public String naver_login(@RequestParam String code, @RequestParam String state) throws JsonParseException, JsonMappingException, IOException, ParseException {
//		
//		String oauthToken = naverLoginBO.getAccessToken(code, state);
//		
//		
//		System.out.println(oauthToken);
//		
//		//apiResult = naverLoginBO.getUserProfile(access_token);
//		
//		//System.out.println(apiResult);
//		
//		return "login/login_form";
//	}

	@RequestMapping("login.do")
	public String go_login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL1);
		String naverConnectUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL2);

		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("connectUrl", naverConnectUrl);

		return "login/login_form";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("naver_login.do")
	public ModelAndView callback(HttpServletResponse response, Model model, ModelAndView mav, @RequestParam String code,
			@RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("code >> " + code + " ............ / state >> " + state);
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, callback_URL1);
		this.access_token = oauthToken.getAccessToken(); // access_token 정보 저장

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken, callback_URL1); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// 파싱 가능한 데이터 : id, nickname, age, gender, email, name
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String id = (String) response_obj.get("id"); // id를 파싱하여 저장
		String name = (String) response_obj.get("name"); // name을 파싱하여 저장

		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sns_id", id);

		int check = dao.snsJoinCheck(hm); // 해당 네이버 아이디로 가입한 회원이 있는지 확인

		if (check > 0) { // 해당 네이버 아이디로 가입한 회원이 있다면 자동 로그인
			mav.addObject("token", oauthToken.getAccessToken());
			mav.setViewName("login/login_form_sns");

			MemberDTO dto = dao.getSnsMemInfo(hm); // 네이버 아이디로 가입한 회원 아이디 불러오기
			session.setAttribute("session_id", dto.getMem_id()); // 세션 생성
			session.setAttribute("session_name", dto.getMem_name());
		} else { // 해당 네이버 아이디로 가입한 회원이 없다면 sns회원가입창으로 이동
			mav.addObject("sns_id", id);
			mav.addObject("sns_name", name);
			mav.addObject("sns_type", "naver");
			mav.setViewName("login/join_form_sns");
		}

		return mav;
	}

	@RequestMapping("sns_join_ok.do")
	public void test_join(MemberDTO dto, HttpServletResponse response) throws IOException {

		int check = dao.snsJoin(dto);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('가입 완료')");
			out.println("location.href='main.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("grant_delete.do")
	public void grant_delete(HttpSession session, HttpServletResponse response, Model model) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		// client_id, client_secret, access_token을 받아서 grant_type = delete로 설정
		String deleteTokenURL = naverLoginBO.deleteToken(this.access_token);
		model.addAttribute("deleteTokenURL", deleteTokenURL);

		String user_id = (String) session.getAttribute("session_id");
		int result = dao.deleteSnsID(user_id);

		if (result > 0) {
			out.println("<script>");
			out.println("alert('네이버 연동 해제 중 . . .')");
			out.println("location.href='" + deleteTokenURL + "'");
			out.println("alert('네이버 연동이 해제되었습니다.')");
			out.println("location.href='main.do'");
			// out.println("location.href='http://nid.naver.com/nidlogin.logout'"); 네이버 로그아웃
			// 처리
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('네이버 연동 해제 오류')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naver_connect.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void naver_connect(Model model, ModelAndView mav, @RequestParam String code, @RequestParam String state,
			HttpSession session, HttpServletResponse response) throws IOException, ParseException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, callback_URL2);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken, callback_URL2); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");

		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("mem_id", (String) session.getAttribute("session_id"));
		hm.put("type", "naver");
		hm.put("sns_id", id);

		int check = dao.snsConnectCheck(hm);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('이미 네이버와 연동되어 있습니다.')");
			out.println("location.href='main.do'");
			out.println("</script>");
		} else {
			int connectCheck = dao.snsJoinCheck(hm);

			if (connectCheck > 0) {
				out.println("<script>");
				out.println("alert('이미 연동된 네이버 계정입니다.')");
				out.println("location.href='main.do'");
				out.println("</script>");
			} else {
				int result = dao.addSnsID(hm);

				out.println("<script>");
				out.println("alert('네이버 연동 성공!')");
				out.println("location.href='main.do'");
				out.println("</script>");
			}
		}

	}

}
