package org.shopmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/about")
	public String about() {
		
		log.info("about 페이지 진입");
		return "about";
	}
	
	@RequestMapping("/allBrand")
	public String allBrand() {
		
		log.info("allBrand 페이지 진입");
		return "allBrand";
	}
	

	
}
