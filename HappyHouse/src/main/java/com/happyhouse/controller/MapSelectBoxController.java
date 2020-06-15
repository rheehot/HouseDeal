package com.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.Sido;
import com.happyhouse.service.MapSelectBoxService;

@RestController
@RequestMapping("/selectbox")
public class MapSelectBoxController {
	@Autowired
	private MapSelectBoxService service;
	
	@GetMapping("/sido")
	public List<Sido> getSidoCode(){
		try {
			return service.findSido();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/gugun/{sido}")
	public List<Gugun> getGugunCode(@PathVariable String sido){
		try {
			return service.findGugun(sido);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/dong/{gugun}")
	public List<HouseInfo> getDong(@PathVariable String gugun){
		System.out.println(gugun);
		try {
			return service.findDong(gugun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/apt/{dong}")
	public ResponseEntity<List<HouseInfo>> getApt(@PathVariable String dong){
		List<HouseInfo> list = null;
		try {
			list = service.findApt(dong);
			for(HouseInfo dto : list)
				System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<List<HouseInfo>>(list, HttpStatus.OK);
	}

}
