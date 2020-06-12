package com.happyhouse.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.happyhouse.domain.QnA;
import com.happyhouse.service.QnAService;

@RestController
@RequestMapping("/api")
public class QnAController {
	@Autowired
	private QnAService service;

	@GetMapping("/qna")
	public ModelAndView getQnAs(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<QnA> list  = null;
		try {
			String key = request.getParameter("key");
			String word = request.getParameter("word");
			list = service.findAll(key, word);
			mav.setViewName("qna/list");
			mav.addObject("qnas", list);
		} catch (Exception e) {
			mav.addObject("msg", "질문 정보를 가져오는 도중 에러가 발생했습니다.");
			mav.setViewName("index");
		}
		return mav;
	}
	
	@PostMapping("/qna")
	public ModelAndView registryQnA(@RequestParam("filename") MultipartFile mFile, @ModelAttribute QnA qna) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.regitry(mFile, qna);
			mav.setViewName("qna/list");
			if(result >= 1) {
				mav.addObject("msg", "정상적으로 등록 되었습니다.");
			}else {
				mav.addObject("msg", "등록 중 오류가 발생했습니다.");
			}
		}catch(Exception e) {
			mav.addObject("msg", "등록 중 오류가 발생했습니다.");
			mav.setViewName("qna/registry"); 
		}
		return mav;
	}
	
	@GetMapping("/qna/{no}")
	public ModelAndView getQnA(@PathVariable("no") int qnaNo) {
		ModelAndView mav = new ModelAndView();
		QnA qna = null;
		List<QnA> list = null;
		try {
			qna = service.findByQnANo(qnaNo);
			list = service.selectReply(qnaNo);
			mav.setViewName("qna/view");
			mav.addObject("qna", qna);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			mav.addObject("msg", "게시글 가져오는 중 오류가 발생했습니다.");
		}
		return mav;
	}
	
	@GetMapping("qna/reply/{no}")
	public List<QnA> getReply(@PathVariable("no") int qnaNo){
		List<QnA> list = null;
		try {
			list = service.selectReply(qnaNo);
		}catch(Exception e) {
			
		}
		return list;
	}
	
	
}
