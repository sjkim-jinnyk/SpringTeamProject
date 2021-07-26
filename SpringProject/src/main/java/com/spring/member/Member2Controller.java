package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.Member2DAO;
import com.spring.model.MemberDTO;

@Controller
public class Member2Controller {
	
	@Autowired
	private Member2DAO dao;
	
	@RequestMapping("join.do")
	public String join() {
		return "login/join_form";
	}
	
	@RequestMapping("join_ok.do")
	public void insertOk(MemberDTO dto, 
			HttpServletResponse response) throws IOException {
		int check = this.dao.insertMember(dto);
		
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
	
	@RequestMapping("login.do")
	public String go_login() {
		return "login/login_form";
	}
	
	@RequestMapping("login_ok.do")
	public void login(
			@RequestParam("mem_id") String id,
			@RequestParam("mem_pwd") String pwd,
			HttpServletResponse response,
			HttpSession session) throws IOException {
		
		int idCheck = this.dao.idCheck(id);
		int pwdCheck = this.dao.pwdCheck(pwd);
		
		MemberDTO login_info = this.dao.getMemberInfo(id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(idCheck == 1) { // 아이디 맞음
			if(pwdCheck > 0) { // 비밀번호 맞음 (같은 비번인 계정이 여러개일 수 있음)
				// session.setAttribute("session_id", login_info);
				session.setAttribute("session_id", login_info.getMem_id());
				session.setAttribute("session_mem", login_info);
				out.println("<script>");
				out.println("alert('로그인 성공')");
				out.println("location.href='main.do'");
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
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("find_id.do")
	public String find_id() {
		return "login/find_id";
	}
	
	@RequestMapping("find_id_ok.do")
	public String find_id_ok(
			@RequestParam("mem_phone") String phone,
			HttpServletResponse response,
			Model model) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = this.dao.findId(phone);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return null;
		} else {
			model.addAttribute("result_id", id);
			return "login/find_id_ok";
		}
		
	}
	
	@RequestMapping("find_pwd.do")
	public String find_pwd() {
		return "login/find_pwd";
	}
	
	@RequestMapping("find_pwd_ok.do")
	public String find_pwd_ok(
			@RequestParam("mem_id") String id,
			HttpServletResponse response,
			Model model) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String pwd = this.dao.findPwd(id);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 아닙니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return null;
		} else {
			model.addAttribute("result_pwd", pwd);
			return "login/find_pwd_ok";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/id_check", method = RequestMethod.POST)
	public String id_Check(MemberDTO dto,
			@RequestParam("mem_id") String id) {
		//select * from member where mem_id = #{mem_id}
		//이 MemberDTO 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.
		MemberDTO m = this.dao.id_overlap(dto);
		String message = null;
		if(m == null) {
			if (id.length()>4 && id.length()<15) {
				message = "success";
			}else {
				message = "fail";
			}
		}else {
			message = "fail";
		}
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value = "/phone_check", method = RequestMethod.POST)
	public String phone_Check(MemberDTO dto) {
		MemberDTO m = this.dao.id_overlap(dto);
		String message = null;
		if(m == null) {
			message = "success";
		}else {
			message = "fail";
		}
		return message;
	}
}
