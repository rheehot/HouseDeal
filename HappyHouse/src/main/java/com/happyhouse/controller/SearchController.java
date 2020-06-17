package com.happyhouse.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.happyhouse.domain.Search;
import com.happyhouse.domain.SearchHit;
import com.happyhouse.service.SearchService;

@RestController
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private SearchService service;

	@PostMapping
	public String updateHit(Search search) {
		System.out.println(search);
		String result = "";
		try {
			if (service.getCountBySearch(search) == 0) {
				service.registrySearch(search);
			}
			// add 하기전
			SearchHit searchHit = new SearchHit();
			searchHit.setAptName(search.getAptName());
			searchHit.setDong(search.getDong());
			searchHit.setUserNo(search.getId());
			searchHit.setInputDate(getDate());
			if(service.getUserHitCount(searchHit) == 0) {
				service.registryUserHit(searchHit);
				service.addHitCount(search);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	@GetMapping
	public List<Search> getSearchList(){
		List<Search> list = null;
		try {
			list = service.findAllSearchs();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public String getDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.format(new Date());
	}
}
