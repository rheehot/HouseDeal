package com.happyhouse.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.service.HouseService;
import com.happyhouse.util.PageNavigation;


@Controller
@RequestMapping("house")
public class HouseController {
	
	@Autowired
	HouseService service;
	
	@PostMapping("list")
	public @ResponseBody List<HouseDeal> selectAll(int currentPage, String[] deal, String key, String word, Model model) {
		boolean[] type = new boolean[4];
		int[] searchNum = new int[5];
		Arrays.fill(searchNum, -1);
		for (String val : deal) {
			type[Integer.parseInt(val) - 1] = true;
			searchNum[Integer.parseInt(val)] = Integer.parseInt(val);
		}

		HousePageBean bean = new HousePageBean();
		bean.setSearchType(type);
		switch (key) {
		case "dong":
			bean.setDong(word); break;
		case "apt":
			bean.setAptname(word); break;
		default:
			bean.setDealtype(word); break;
		}
		bean.setSearchNum(searchNum);
		bean.setStart((currentPage - 1) * 10);
		bean.setInterval(10);
		
		List<HouseDeal> list = service.searchAll(bean);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage-1, 10, bean);
		
		System.out.println(list.size());
		model.addAttribute("navigation", pageNavigation);
		
		return list;
	}
	
	@GetMapping("detail/{no}")
	public String detail(@PathVariable int no, Model model) {
		System.out.println("세부사항");
		HouseInfo houseinfo = service.detail(no);
		model.addAttribute("house", houseinfo);
		return "house/detail";
	}

}
