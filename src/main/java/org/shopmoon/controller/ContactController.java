package org.shopmoon.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.MemberVO;
import org.shopmoon.domain.PageDTO;
import org.shopmoon.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
public class ContactController {

	@Autowired
	private ContactService contactservice;

	
	// contact 페이지 진입 / 모든 글 조회 / 페이징 
	@RequestMapping(value = "/contactList", method = RequestMethod.GET)
	public void contactGetList(Criteria cri, Model model, HttpServletRequest request, MemberVO member) throws Exception {
		
		log.info("contact 페이지 진입");
		
		// 문의 글 목록 출력
		List list = contactservice.contactGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 문의자 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 문의자 존재하지 않을 경우
		}
		
		// 페이징 로직
		int total = contactservice.contactGetTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		// 문의 글 작성 비회원 유효성 검사
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("member");
		
		int no = 1;
		if(member == null) {
			model.addAttribute("loginConfirm", no);
		}
	
	}
	
	// 문의 글 작성 뷰
	@RequestMapping("/contactWriteView")
	public String contactWriteView(HttpServletRequest request, MemberVO member, Model model) {
		
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("memberId", member.getMemberId());
		
		return "./community/contactWriteView";
	}
	
	// 문의 글 작성 메소드 진입
		@RequestMapping(value = "/contactWrite", method = RequestMethod.POST)
		public String contactWritePOST(HttpServletRequest request, ContactVO contact) throws Exception {
			
			log.info("문의 글 저장 메소드 진입");
			
			contactservice.contactWrite(contact);
			
			log.info("문의 글 DB 등록 완료");
			return "redirect:/community/contactList";
		}
		
}
