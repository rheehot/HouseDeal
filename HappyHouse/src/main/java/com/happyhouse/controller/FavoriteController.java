package com.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyhouse.domain.FavoriteLocation;
import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.Sido;
import com.happyhouse.domain.User;
import com.happyhouse.service.FavoriteService;

@Controller
@RequestMapping("favorite")
public class FavoriteController {
	
	@Autowired
	FavoriteService service;

	@GetMapping("changeloc")
	public String changeLocation(Model model) {
		List<Sido> sidoList = service.sidoList();
		model.addAttribute("sidolist", sidoList);
		return "bookmark/location";
	}
	
	@GetMapping("gugun/{sidoCode}")
	public @ResponseBody List<Gugun> gugun(@PathVariable String sidoCode) {
		String sido = sidoCode.substring(0, 2);
		List<Gugun> gugunList = service.gugunList(sido);
		return gugunList;
	}
	
	@PutMapping
	public @ResponseBody String modifyFavorite(String code, HttpSession session) {
		System.out.println("관심지역 수정 시도");
		System.out.println(code);
		int userNo = ((User) session.getAttribute("userinfo")).getUserNo();
		
		FavoriteLocation result = service.getFavoriteLocation(userNo);
		if(result == null) service.setFavoriteLocation(code, userNo);
		else service.modify(code, userNo);
		
		return "success";
	}
}
