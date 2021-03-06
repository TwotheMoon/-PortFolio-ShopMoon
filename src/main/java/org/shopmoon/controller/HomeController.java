package org.shopmoon.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class HomeController {
	
	@Autowired
	private ContactService contactservice;
	
	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Criteria cri, Model model, HttpServletRequest request, MemberVO member) throws Exception {
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
		return "home";
	}
	
	// about 페이지
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String about() {
		
		log.info("about 페이지 진입");
		return "./about/about";
	}
	
	// allBrand 페이지
	@RequestMapping(value="/allBrand", method = RequestMethod.GET)
	public String allBrand() {
		
		log.info("allBrand 페이지 진입");
		return "./about/allBrand";
	}
	
	// wayToCome 페이지
	@RequestMapping(value="/wayToCome", method = RequestMethod.GET)
	public String wayToCome() {
		
		log.info("wayToCome 페이지 진입");
		return "./community/wayToCome";
	}
	
	// 이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		File file = new File("c:\\shopMoonUpload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

}
