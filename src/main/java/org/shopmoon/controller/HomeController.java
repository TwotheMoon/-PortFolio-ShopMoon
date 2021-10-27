package org.shopmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String about() {
		
		log.info("about 페이지 진입");
		return "./about/about";
	}
	
	@RequestMapping(value="/allBrand", method = RequestMethod.GET)
	public String allBrand() {
		
		log.info("allBrand 페이지 진입");
		return "./about/allBrand";
	}
	
	@RequestMapping(value="/wayToCome", method = RequestMethod.GET)
	public String wayToCome() {
		
		log.info("wayToCome 페이지 진입");
		return "./community/wayToCome";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		
		log.info("contact 페이지 진입");
		return "./community/contact";
	}
}
