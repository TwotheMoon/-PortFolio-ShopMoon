package org.shopmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class aboutController {

	@RequestMapping("/about")
	public String about() {
		
		return "about";
	}
	
	@RequestMapping("/allBrand")
	public String allBrand() {
		
		return "allBrand";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
}
