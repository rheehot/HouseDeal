package com.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("favorite")
public class FavoriteController {

	@GetMapping("changeloc")
	public String changeLocation(Model model) {
		return "bookmark/location";
	}
}
