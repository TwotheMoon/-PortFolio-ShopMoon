package org.shopmoon.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.MemberVO;
import org.shopmoon.domain.PageDTO;
import org.shopmoon.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		int no = 0;
		int yes = 1;
		if(member == null) {
			model.addAttribute("loginConfirm", no);
		} else {
			model.addAttribute("loginConfirm", yes);
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
		
	// 문의 글 상세 페이지 ,  수정 페이지
		@RequestMapping({"/contactDetail", "/contactModify"})
		public void contactGetDetail(Long contactNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
			log.info("문의 글 상세 페이지 진입");
			
			String DBmemberId = contactservice.contactGetMemberId(contactNo);
			log.info("DB아이디 " + DBmemberId);
			
			HttpSession session = request.getSession();
			MemberVO memberInfo = (MemberVO) session.getAttribute("member");
			String memberId = "";
			
			if(memberInfo == null) {
				int result = 0;
				model.addAttribute("result", result);
			} else {
				memberId = memberInfo.getMemberId();
				log.info("세션 아이디 " + memberId);
				
				if(memberId.equals(DBmemberId)) {
					int result = 1;
					model.addAttribute("result", result);
				}
			}
			
			
			
			// 페이지 정보
			model.addAttribute("cri", cri);
			//
			model.addAttribute("contactInfo", contactservice.contactGetDetail(contactNo));
			
		}
		
		// 문의 글 내용 수정 
		@PostMapping("/contactModify")
		public String contactModifyPOST(ContactVO contact, RedirectAttributes rttr) throws Exception{
			
			log.info("authorModifyPOST......." + contact);
			
			int result = contactservice.contactModify(contact);
			
			rttr.addFlashAttribute("modify_result", result);
			
			return "redirect:/community/contactList";
			
		}
		
		
		// 문의 글 삭제
		@PostMapping("/contactDelete")
		public String contactDeletePost(Long contactNo, RedirectAttributes rttr) throws Exception{
			
			int result = contactservice.contactDelete(contactNo);
			
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/community/contactList";
		}
		
		
}
