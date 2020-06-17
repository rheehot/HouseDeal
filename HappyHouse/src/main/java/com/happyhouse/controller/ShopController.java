package com.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happyhouse.domain.FavoriteLocation;
import com.happyhouse.domain.Shop;
import com.happyhouse.domain.User;
import com.happyhouse.service.FavoriteService;
import com.happyhouse.service.ShopService;
import com.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("shop")
public class ShopController {

	@Autowired
	private ShopService service;
	
	@Autowired
	private FavoriteService favService;

	@GetMapping("list")
	public String boardList(int pg, String filter, String key, String word, Model model, HttpSession session) {
		System.out.println("상점");
		String code = "";
		
		//System.out.println(filter);
		
		// 상권 정보에 처음 들어갔을 경우에만 관심지역 리스트 출력
		if(filter == null) {
			int userNo = ((User) session.getAttribute("userinfo")).getUserNo();
			FavoriteLocation result = favService.getFavoriteLocation(userNo);

			if (result != null) code = result.getCode().substring(0, 5);
		} else System.out.println(filter);
		
		int currentPage = pg;
		int sizePerPage = 10; // 페이지당 글 개수
		List<Shop> list = service.selectAll(currentPage - 1, sizePerPage, key, word, code);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, key, word, code);
		model.addAttribute("shops", list);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("pg", currentPage);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		return "shop/shopList";
	}
}
