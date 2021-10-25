package org.shopmoon.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.shopmoon.domain.MemberVO;
import org.shopmoon.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		
		log.info("로그인 페이지 진입");
		return "login";
	}

	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp() {
		
		log.info("회원가입 페이지 진입");
		return "signUp";
	}
	
	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPOST(MemberVO member) throws Exception{
	
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		log.info("signUp service 성공");
		return "redirect:/";
	}
	

	
}
