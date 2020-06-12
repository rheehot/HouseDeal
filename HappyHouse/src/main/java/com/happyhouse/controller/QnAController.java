package com.happyhouse.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happyhouse.domain.QnA;
import com.happyhouse.service.QnAService;

@Controller
@RequestMapping("/api")
public class QnAController {
	@Autowired
	private QnAService service;

	@GetMapping("/qna")
	public ModelAndView getQnAs(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<QnA> list  = null;
		try {
			mav.setViewName("index");
			String key = request.getParameter("key");
			String word = request.getParameter("word");
			System.out.println("test1");
			list = service.findAll(key, word);
			System.out.println("test2");
			for(QnA qna : list) {
				System.out.println(qna);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			mav.setViewName("index");
		}
		return mav;

	}
}
