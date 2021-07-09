package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			HttpServletResponse response) throws IOException {
		
		int idCheck = this.dao.idCheck(id);
		int pwdCheck = this.dao.pwdCheck(pwd);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(idCheck == 1) { // 아이디 맞음
			if(pwdCheck > 0) { // 비밀번호 맞음 (같은 비번인 계정이 여러개일 수 있음)
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
	
}
