package com.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happyhouse.domain.Board;

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
	
	@GetMapping("move/writeboardpage")
	public String mvWriteBoard() {
		return "board/insertBoard";
	}
	
	@PostMapping("move/modifyboardpage")
	public String mvModifyBoard(Board board, Model model) {
		//System.out.println(board.getId() + board.getTitle() + " " + board.getContent());
		model.addAttribute("board", board);
		return "board/modifyBoard";
	}
}
