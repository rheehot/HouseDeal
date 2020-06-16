package com.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.happyhouse.domain.Board;
import com.happyhouse.service.BoardService;
import com.happyhouse.util.PageNavigation;

@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/boards")
	public ModelAndView boardList(HttpServletRequest request) {
		System.out.println("공지사항");
		ModelAndView mav = new ModelAndView();
		int currentPage = Integer.parseInt(request.getParameter("pg")); // 현재페이지번호
		String spp = request.getParameter("spp"); // 한 페이지당 글 개수
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);// sizePerPage
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		List<Board> list = service.selectAll(currentPage - 1, sizePerPage, key, word);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, key, word);
		mav.setViewName("board/boardList");
		mav.addObject("boards", list);
		mav.addObject("navigation", pageNavigation);
		mav.addObject("pg", currentPage);
		mav.addObject("key", key);
		mav.addObject("word", word);
		return mav;
	}
	
	@PostMapping("/writeboard")
	public String writeBoard(Board board) {
		int result = service.regist(board);
		if (result >= 1) return "success";
		else return "fail";
	}
	
	@GetMapping("/board/{id}")
	public ModelAndView viewBoard(@PathVariable int id) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("board/viewBoard");
			mav.addObject("board", service.select(id));
		} catch (Exception e) {
			mav.setViewName("error/error");
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}
	
	@DeleteMapping("/board/{id}")
	public String removeBoard(@PathVariable int id) {
		System.out.println("id >> " + id);
		int result = service.delete(new String[] { String.valueOf(id) });
		if (result >= 1) return "success";
		else return "fail";
	}
	
	@PutMapping("/board")
	public String modifyBoard(Board board) {
		System.out.println("수정시도");
		System.out.println(board.getId() + " " + board.getTitle() + " " + board.getContent());
		int result = service.update(board);
		if (result >= 1) return "success";
		else return "fail";
	}
	
}
