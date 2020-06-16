package com.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
		System.out.println("in1");
		ModelAndView mav = new ModelAndView();
		List<QnA> list  = null;
		try {
			String key = request.getParameter("key");
			String word = request.getParameter("word");
			list = service.findAll(key, word);
			System.out.println("in2");
			for(QnA qna : list) {
				QnA getQnA = null;
				if((getQnA = service.getReplyCount(qna.getQnaNo())) != null) 
					qna.setReplyCnt(getQnA.getReplyCnt());
				else
					qna.setReplyCnt(0);
			}
			mav.setViewName("qna/list");
			mav.addObject("qnas", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			mav.addObject("msg", "질문 정보를 가져오는 도중 에러가 발생했습니다.");
			mav.setViewName("error/error");
		}
		return mav;
	}
	
	@PostMapping("/qna")
	public ModelAndView registryQnA(@RequestParam("filename") MultipartFile mFile, @ModelAttribute QnA qna) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.regitry(mFile, qna);
			if(result >= 1) {
				mav.setViewName("qna/list");
				mav.addObject("msg", "정상적으로 등록 되었습니다.");
			}else {
				mav.setViewName("error/error");
				mav.addObject("msg", "등록 중 오류가 발생했습니다.");
			}
		}catch(Exception e) {
			mav.addObject("msg", "등록 중 오류가 발생했습니다.");
			mav.setViewName("error/error"); 
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
			mav.setViewName("qna/view");
			mav.addObject("qna", qna);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			mav.setViewName("error/error");
			mav.addObject("msg", "게시글 가져오는 중 오류가 발생했습니다.");
		}
		return mav;
	}
	
	@GetMapping("/qna/reply/{no}")
	public List<QnA> getReply(@PathVariable("no") int qnaNo){
		List<QnA> list = null;
		try {
			list = service.selectReply(qnaNo);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	@PutMapping("/qna/reply")
	public String modifyReply(QnA qna) {
		String result = null;
		try {
			if(service.modifyReply(qna) >= 1) {
				result = "suc";
			}else {
				result = "err";
			}
		}catch(Exception e) {
			result = "err"; 
		}
		return result;
	}
	
	@DeleteMapping("/qna/reply/{no}")
	public String removeReply(@PathVariable("no") int qnaNo){
		String result = null;
		try {
			if(service.removeReply(qnaNo) >= 1) {
				result = "suc";
			}else {
				result = "err";
			}
		}catch(Exception e) {
			result = "err"; 
		}
		return result;
	}
	
	@PostMapping("/qna/reply")
	public String registryReply(QnA qna) {
		String result = null;
		try {
			if(service.regitryReply(qna) >= 1) {
				result = "suc";
			}else {
				result = "err";
			}
		}catch(Exception e) {
			result = "err"; 
		}
		return result;
	}
	
	@GetMapping("/qna/reply/cnt/{no}")
	public QnA getReplyCount(@PathVariable int no) {
		QnA qna = null;
		try {
			qna = service.getReplyCount(no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return qna;
	}
	
	@PutMapping("/qna")
	public String updateQnA(QnA qna) {
		String result = null;
		try {
			if(service.modify(qna) >= 1) {
				result = "suc";
			}else {
				result = "err";
			}
		}catch(Exception e) {
			result = "err"; 
		}
		return result;
	}
	@DeleteMapping("/qna/{no}")
	public String deleteQnA(@PathVariable int no) {
		String result = null;
		try {
			if(service.remove(no) >= 1) {
				result = "suc";
			}else {
				result = "err";
			}
		}catch(Exception e) {
			result = "err"; 
		}
		return result;
	}
}
