package com.happyhouse.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.service.HouseService;


@Controller
@RequestMapping("house")
public class HouseController {
	
	@Autowired
	HouseService service;
	
	@PostMapping("list")
	public @ResponseBody List<HouseDeal> selectAll(String[] deal, String key, String search) {
		System.out.println(deal + " " + key + " " + search);
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
			bean.setDong(search); break;
		case "apt":
			bean.setAptname(search); break;
		default:
			bean.setDealtype(search); break;
		}
		bean.setSearchNum(searchNum);
		bean.setStart(0);
		bean.setInterval(30);
		List<HouseDeal> list = service.searchAll(bean);

		return list;
	}

}
