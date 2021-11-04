package org.shopmoon.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.MemberVO;
import org.shopmoon.domain.PageDTO;
import org.shopmoon.mapper.AttachMapper;
import org.shopmoon.mapper.ShopMapper;
import org.shopmoon.service.AdminService;
import org.shopmoon.service.ContactService;
import org.shopmoon.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/shop/*")
@Log4j
public class ShopController {
	
	@Autowired
	private ShopService shopservice;
	
	@Autowired
	private AttachMapper attachmapper;
	
	
	// 기타 리스트 페이지 이동 및 조회
	@RequestMapping(value = "guitarList", method = RequestMethod.GET)
	public void guitarList(Criteria cri, Model model) throws Exception{
		
		log.info("기타 리스트 이동");
		
		List list = shopservice.guitarGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopservice.guitarGetTotal(cri)));
	}
	
	// 기타 상세 페이지
	@RequestMapping("/guitarDetail")
	public void guitarGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		
		log.info("기타 상세 페이지");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		
		model.addAttribute("guitarInfo", shopservice.shopGetDetail(productNo));
	}
	
	
	// 베이스 리스트 페이지 이동 및 조회
	@RequestMapping(value = "baseList", method = RequestMethod.GET)
	public void baseList(Criteria cri, Model model) throws Exception{
		
		log.info("베이스 리스트 이동");
		
		List list = shopservice.baseGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopservice.baseGetTotal(cri)));
	}
	
	// 베이스 상세 페이지
	@RequestMapping("/baseDetail")
	public void baseGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		
		log.info("베이스 상세 페이지");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		
		model.addAttribute("baseInfo", shopservice.shopGetDetail(productNo));
	}
	
	
	
	// 이미지 정보 반환
	@GetMapping(value = "/getAttachListMain", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(Long productNo){
		
		log.info("/getAttachList... " + productNo);
		
		return new ResponseEntity<List<AttachImageVO>>(attachmapper.getAttachList(productNo), HttpStatus.OK);
		
	}
	
}
