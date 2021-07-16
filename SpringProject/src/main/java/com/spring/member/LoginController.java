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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.model.CartDAO;
import com.spring.model.LoginDAO;
import com.spring.model.MemberDTO;
import com.spring.model.NaverLoginBO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private LoginDAO dao;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "sns_login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/login_form_sns";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "login_result.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(Model model, ModelAndView mav, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		System.out.println("nickname >> " + nickname);
		System.out.println("id>> "+id);
		System.out.println("email>> "+(String) response_obj.get("email"));
		System.out.println("name>> "+(String) response_obj.get("name"));
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		
		int check = dao.naverJoinCheck(hm);
		
		if(check > 0) {
			mav.addObject("result", apiResult);
			mav.setViewName("login/login_form_sns");
			
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("session_id", nickname); // 세션 생성
		}else {
			mav.addObject("result", apiResult);
			mav.addObject("sns_id", id);
			mav.addObject("sns_name", name);
			mav.addObject("sns_type", "naver");
			mav.setViewName("login/join_form_sns");
		}
		
		return mav;
	}
	
	@RequestMapping("test_join_ok.do")
	public void test_join(MemberDTO dto, HttpServletResponse response) throws IOException {
		
		int check = dao.snsJoin(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('가입 완료')");
			out.println("location.href='main.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("grant_delete.do")
	public String grant_delete(@RequestParam("token") String token) {
		
		System.out.println("token >> "+token);
		
		// client_id, client_secret, access_token을 받아서
		//grant_type = delete로 설정
		
		return "home";
	}

}
