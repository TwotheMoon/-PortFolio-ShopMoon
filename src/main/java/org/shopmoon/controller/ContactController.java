package org.shopmoon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.MemberVO;
import org.shopmoon.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/contact/*")
public class ContactController {

	@Autowired
	private ContactService contactservice;

	
	// contact 모든 문의 글 조회
	@RequestMapping(value = "/contactList", method = RequestMethod.GET)
	public String contactList() {
		
		log.info("contact 페이지 진입");
		return "./community/contact";
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
			return "redirect:/contact/contactList";
		}
		
}
