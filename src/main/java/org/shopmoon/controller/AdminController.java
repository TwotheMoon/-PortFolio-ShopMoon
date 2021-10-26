package org.shopmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public void adminMain() throws Exception{
		
		log.info("관리자 페이지 이동");
		
	}
}
