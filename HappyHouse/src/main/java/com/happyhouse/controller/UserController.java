package com.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happyhouse.domain.User;
import com.happyhouse.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService service;

	@RequestMapping("loginpage")
	public String loginPage() {
		return "user/login";
	}

	@RequestMapping("login")
	public String login(User input, HttpSession session, Model model) {
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

}
