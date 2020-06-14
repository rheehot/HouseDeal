package com.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.happyhouse.domain.Dust;
import com.happyhouse.service.DustService;

@RestController
@RequestMapping("/api")
public class DustController {
	
	@Autowired
	DustService service;
	
	@GetMapping("/dust")
	public List<Dust> getDusts(){
		return service.findAll();
	}
}
