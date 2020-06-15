package com.happyhouse.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HouseDetail;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.service.HouseService;
import com.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("house")
public class HouseController {

	@Autowired
	HouseService service;

	@GetMapping("list")
	public @ResponseBody Response selectAll(int currentPage, String[] deal, String key, String word, Model model) {
		System.out.println(currentPage);
		System.out.println(Arrays.toString(deal));
		System.out.println(key + "  " + word);
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
			bean.setDong(word);
			break;
		case "apt":
			bean.setAptname(word);
			break;
		default:
			bean.setDealtype(word);
			break;
		}
		bean.setSearchNum(searchNum);
		bean.setStart((currentPage - 1) * 10);
		bean.setInterval(10);

		List<HouseDeal> list = service.searchAll(bean);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage - 1, 10, bean);

		Response response = new Response(list, pageNavigation);
		return response;
	}

	@GetMapping("/detail/{no}")
	public ModelAndView getHouseByNo(@PathVariable int no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/detail");
		mav.addObject("houses", service.findHouseDetailByNo(no));
		return mav;
	}

	@GetMapping("/detail/{dong}/{aptName}")
	public ModelAndView getHouseByDongAptName(@PathVariable String dong, @PathVariable String aptName) {
		HouseDetail houseDetail = new HouseDetail();
		houseDetail.setDong(dong);
		houseDetail.setAptName(aptName);
		System.out.println(dong + aptName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/detail");
		mav.addObject("houses", service.findHouseDetailByDongAptName(houseDetail));
		return mav;
	}

	class Response {
		private List<HouseDeal> list;
		private PageNavigation pageNavigation;

		public Response() {

		}

		public Response(List<HouseDeal> list, PageNavigation pageNavigation) {
			this.list = list;
			this.pageNavigation = pageNavigation;
		}

		public List<HouseDeal> getList() {
			return list;
		}

		public void setList(List<HouseDeal> list) {
			this.list = list;
		}

		public PageNavigation getPageNavigation() {
			return pageNavigation;
		}

		public void setPageNavigation(PageNavigation pageNavigation) {
			this.pageNavigation = pageNavigation;
		}

	}
}
