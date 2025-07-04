package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.dao.MemberDao;

@Controller
public class LoginController {
	
	@Autowired
	MemberDao dao;
	
	@PostMapping("/login/loginprocess")
	public String loginCheck(HttpSession session,
			@RequestParam String id,
			@RequestParam String pass)
	{
			int n=dao.loginCheck(id, pass);
			
			if(n==1)
			{
				//세션저장
				session.setAttribute("loginok", "yes");
				session.setAttribute("myid", id);
				
				//메인페이지로 리다이렉트
				return "redirect:../home";
			}else {
				
				//실패
				return "/login/loginFail";
			}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		
		return "redirect:../home";
	}
}
