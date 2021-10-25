package org.shopmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
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
	
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "signUp";
	}
	
}
