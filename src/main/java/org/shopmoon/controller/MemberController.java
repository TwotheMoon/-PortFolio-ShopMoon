package org.shopmoon.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.MemberVO;
import org.shopmoon.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	// 로그인 페이지 진입
	@RequestMapping("/login")
	public String login() {
		
		log.info("로그인 페이지 진입");
		return "./member/login";
	}
	
	// 회원 로그인 메소드
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
							// 로그인 성공시 세션 저장을 위해  // 회원 데이터 받기위해  // 로그인 실패시 실패 페이지 리다이렉트

		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = memberservice.memberLogin(member);
		
		if(lvo != null) {
			
			rawPw = member.getMemberPw(); // 사용자 제출 비밀번호
			encodePw = lvo.getMemberPw(); // DB 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				
				lvo.setMemberPw(""); // 인코딩된 비밀번호 정보 삭제
				session.setAttribute("member", lvo);
				return "redirect:/";
				
			} else {
				
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
			
		} else {
			
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
	}
	
	// 로그아웃 메소드
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		
		log.info("로그아웃 완료");
		
		return "redirect:/member/login";
	}
	
	
	// 회원가입 페이지 진입
	@RequestMapping("/signUp")
	public String signUp() {
		
		log.info("회원가입 페이지 진입");
		return "./member/signUp";
	}
	
	// 회원가입 메소드 (+ pw암호화)
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUpPOST(MemberVO member) throws Exception{
	
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setMemberPw(encodePw);
		
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		log.info("signUp service 성공");
		return "redirect:/";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		/* log.info("memberIdChk() 진입"); */
		int result = memberservice.idCheck(memberId);
		//log.info("결과 : " + result);
		
		if(result != 0) {
			return "fail"; // 1이면 중복 아이디 존재
		} else {
			return "success";
		}
	}


	
}
