package com.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping
	public String home() {
		return "index";
	}
	
	@GetMapping("move/qnainsert")
	public String movePageQnAInsert() {
		return "qna/registry";
	}
	
	@GetMapping("move/dust")
	public String moveDust() {
		System.out.println("HomeController >> move/dust API 호출");
		return "dust/index";
	}
	
	@GetMapping("move/house")
	public String moveHouse() {
		return "house/index";
	}
}
