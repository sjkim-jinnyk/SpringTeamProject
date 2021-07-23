package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.model.LoginDAO;
import com.spring.model.Member2DAO;
import com.spring.model.MemberDTO;
import com.spring.model.NaverLoginBO;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private String callback_URL1 = "http://localhost:8585/member/naver_login.do";
	private String callback_URL2 = "http://localhost:8585/member/naver_connect.do";
	private String access_token;

	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private Member2DAO mdao;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping("login.do")
	public String login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL1);		
		model.addAttribute("url", naverAuthUrl);

		return "login/login_form";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("naver_login.do")
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, callback_URL1);
		this.access_token = oauthToken.getAccessToken();

		// 1. 프로필 조회
		apiResult = naverLoginBO.getUserProfile(oauthToken, callback_URL1); 

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		/* json 형식으로 아래와 같이 데이터가 넘어오게 됨.
		 * {
			  "resultcode": "00",
			  "message": "success",
			  "response": {
			    "email": "openapi@naver.com",
			    "nickname": "OpenAPI",
			    "profile_image": "https://ssl.pstatic.net/static/pwe/address/nodata_33x33.gif",
			    "age": "40-49",
			    "gender": "F",
			    "id": "32742776",
			    "name": "오픈 API",
			    "birthday": "10-01"
			    "birthyear" : "9999"
			    "mobile": "010-1234-5678"
			  }
			}
		 */
		
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String id = String.valueOf(response_obj.get("id"));			// id를 파싱하여 저장
		String name = String.valueOf(response_obj.get("name")); 	// name을 파싱하여 저장
		String mobile = String.valueOf(response_obj.get("mobile"));	// 휴대전화 번호를 파싱하여 저장

		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sns_id", id);

		int check = dao.snsJoinCheck(hm); // 해당 네이버 아이디로 가입한 회원이 있는지 확인

		ModelAndView mav = new ModelAndView();

		if (check > 0) { // 해당 네이버 아이디로 가입한 회원이 있다면 자동 로그인

			mav.setViewName("home");

			MemberDTO dto = dao.getSnsMemInfo(hm); // 네이버 아이디로 가입한 회원 아이디 불러오기
			session.setAttribute("session_id", dto.getMem_id()); // 세션에 회원 저장
			session.setAttribute("session_mem", dto);

		} else { // 해당 네이버 아이디로 가입한 회원이 없다면 sns회원가입창으로 이동
			mav.addObject("sns_id", id);
			mav.addObject("sns_name", name);
			mav.addObject("sns_type", "naver");
			mav.addObject("sns_phone", mobile);
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
			// out.println("window.open('http://nid.naver.com/nidlogin.logout', '네이버 로그아웃', '_blank')"); // 네이버 로그아웃 처리
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('연동 해제 오류')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("sns_connect.do")
	public String sns_connect(HttpSession session, Model model) {
		String naverConnectUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL2);
		model.addAttribute("url", naverConnectUrl);
		
		return "login/sns_connect";
	}

	// 네이버 연동 인증 성공시 callback호출 메소드
	@RequestMapping("naver_connect.do")
	public void naver_connect(Model model, ModelAndView mav, @RequestParam String code, @RequestParam String state,
			HttpSession session, HttpServletResponse response) throws IOException, ParseException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, callback_URL2);
		this.access_token = oauthToken.getAccessToken();

		// 1. 프로필 조회
		apiResult = naverLoginBO.getUserProfile(oauthToken, callback_URL1); 

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String id = String.valueOf(response_obj.get("id"));

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
	
	@RequestMapping("login_popup.do")
	public String login_popup(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL1);
		String naverConnectUrl = naverLoginBO.getAuthorizationUrl(session, callback_URL2);

		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("connectUrl", naverConnectUrl);
		
		return "login/login_popup";
	}
	
	@RequestMapping("login_popup_ok.do")
	public void login(
			@RequestParam("mem_id") String id,
			@RequestParam("mem_pwd") String pwd,
			HttpServletResponse response,
			HttpSession session) throws IOException {
		
		int idCheck = this.mdao.idCheck(id);
		int pwdCheck = this.mdao.pwdCheck(pwd);
		
		MemberDTO login_info = this.mdao.getMemberInfo(id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(idCheck == 1) { // 아이디 맞음
			if(pwdCheck > 0) { // 비밀번호 맞음 (같은 비번인 계정이 여러개일 수 있음)
				// session.setAttribute("session_id", login_info);
				session.setAttribute("session_id", login_info.getMem_id());
				session.setAttribute("session_mem", login_info);
				out.println("<script>");
				out.println("opener.document.location.reload()");
				out.println("window.close()");
				out.println("</script>");
			}else {		// 비밀번호 틀림
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다. 다시 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {	// 아이디 틀림 (회원 아님)
			out.println("<script>");
			out.println("alert('회원이 아닙니다. 가입 후 이용해주세요.')");
			out.println("location.href='join.do'");
			out.println("</script>");
		}
		
		System.out.println(idCheck+ ", " +pwdCheck);
	}

}
