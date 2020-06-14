package com.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyhouse.domain.User;
import com.happyhouse.service.UserService;
import com.happyhouse.util.PageNavigation;

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
		System.out.println("로그인 정보 >> " + input);
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
		System.out.println("로그아웃 시도");
		session.invalidate();
		return "index";
	}

	@RequestMapping("joinpage")
	public String joinPage() {
		return "user/join";
	}
	
	@PostMapping("join")
	public @ResponseBody String join(User user) {
		System.out.println("가입 정보 >> " + user);
		int result = service.signUp(user);
		if (result == 1) return "success";
		else return "fail";
	}
	
	@RequestMapping("updatepage")
	public String updatePage(HttpSession session, Model model) {
		User input = (User) session.getAttribute("userinfo");
		System.out.println("세션 정보 >> " + input);
		User user = service.detail(input.getId());
		System.out.println("유저 정보 >> " + user);
		
		model.addAttribute("user", user);
		return "user/update";
	}
	
	@PostMapping("update")
	public @ResponseBody String update(User user) {
		System.out.println(user);
		int result = service.Modify(user);
		if(result == 1) return "success";
		else return "fail";
	}
	
	@RequestMapping("userlist/{currentPage}")
	public String userList(@PathVariable int currentPage, String key, String word, Model model) {
		System.out.println("회원 정보 리스트");
		int sizePerPage = 10;
		System.out.println(currentPage + " " + sizePerPage + " " + key + " " + word);
		List<User> list = service.list(currentPage - 1, sizePerPage, key, word);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, key, word);
		model.addAttribute("list", list);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("key", key);
//		model.addAttribute("list", list);
//		model.addAttribute("list", list);
		return "user/list";
	}
	
	@GetMapping("userinfo/{id}")
	public String userInfo(@PathVariable String id, Model model) {
		System.out.println(id);
		User user = service.detail(id);
		System.out.println(user);
		if (user != null) {
			model.addAttribute("user", user);
			return "user/detail";
		} else {
			model.addAttribute("msg", "회원 정보를 불러오는데 실패하였습니다.");
			return "error/error";
		}
	}
	
	@GetMapping("delete/{list}") // /{list}
	public @ResponseBody String delete(@PathVariable int[] list, HttpServletRequest request) { // @PathVariable int[] list
		//int[] list = request.getParameter("list");
		System.out.println("삭제 시도");
		System.out.println("개수 >> " + list.length);
		for(int n : list) System.out.print(n + " ");
		
		 service.remove(list);
		 return "success";
	}

}
