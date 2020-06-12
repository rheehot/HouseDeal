package com.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyhouse.domain.User;
import com.happyhouse.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService service;

	@RequestMapping("loginpage")
	public String loginPage() {
		return "user/login";
	}

	@RequestMapping("login")
	public String login(User input, HttpSession session, Model model) {
		System.out.println(input);
		User user = service.login(input);
		if (user != null) {
			session.setAttribute("userinfo", user);
			return "index";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인 해 주세요.");
			return "error/error";
		}
	}

	@RequestMapping("logout")
	public String login(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping("joinpage")
	public String joinPage() {
		return "user/join";
	}
	
	@PostMapping("join")
	public @ResponseBody String join(User user) {
		System.out.println(user);
		int result = service.signUp(user);
		if (result == 1) return "success";
		else return "fail";
//		else {
//			model.addAttribute("msg", "회원가입에 실패하였습니다.");
//			return "error/error";
//		}
	}

}
