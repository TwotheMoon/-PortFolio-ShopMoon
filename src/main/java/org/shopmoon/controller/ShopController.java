package org.shopmoon.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.CartVO;
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
import org.springframework.web.bind.annotation.RequestAttribute;
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
	public void guitarList(Model model) throws Exception{
		
		log.info("기타 리스트 이동");
		
		Criteria cri = new Criteria(1,8);
		
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
	@RequestMapping(value = "bassList", method = RequestMethod.GET)
	public void bassList(Criteria cri, Model model) throws Exception{
		
		log.info("베이스 리스트 이동");
		
		List list = shopservice.bassGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopservice.bassGetTotal(cri)));
	}
	
	// 베이스 상세 페이지
	@RequestMapping("/bassDetail")
	public void bassGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		
		log.info("베이스 상세 페이지");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		
		model.addAttribute("bassInfo", shopservice.shopGetDetail(productNo));
	}
	
	// 미디 리스트 페이지 이동 및 조회
	@RequestMapping(value = "midiList", method = RequestMethod.GET)
	public void midiList(Criteria cri, Model model) throws Exception{
		
		log.info("미디 리스트 이동");
		
		List list = shopservice.midiGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopservice.midiGetTotal(cri)));
	}
	
	// 미디 상세 페이지
	@RequestMapping("/midiDetail")
	public void midiGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		
		log.info("미디 상세 페이지");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		
		model.addAttribute("midiInfo", shopservice.shopGetDetail(productNo));
	}
	
	// 앨범 리스트 페이지 이동 및 조회
	@RequestMapping(value = "albumList", method = RequestMethod.GET)
	public void albumList(Criteria cri, Model model) throws Exception{
		
		log.info("앨범 리스트 이동");
		
		List list = shopservice.albumGetList(cri);
		
		// 키워드 검색 결과
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopservice.albumGetTotal(cri)));
	}
	
	// 앨범 상세 페이지
	@RequestMapping("/albumDetail")
	public void albumGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		
		log.info("앨범 상세 페이지");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		
		model.addAttribute("albumInfo", shopservice.shopGetDetail(productNo));
	}
	
	// 장바구니 페이지
//  @RequestMapping("/cartEnroll")
//	public void cartGetList(HttpServletRequest request, HttpSession session, CartVO cart) {
//		
//		log.info("장바구니 리스트");
//
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		if(member == null) {
//			
//		} else {
//			
//			String memberId = member.getMemberId();
//			cart.setMemberId(memberId);
//			shopservice.cartEnroll(cart);
//			
//		}
//	}
	
	
	
	// 이미지 정보 반환
	@GetMapping(value = "/getAttachListMain", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(Long productNo){
		
		log.info("/getAttachList... " + productNo);
		
		return new ResponseEntity<List<AttachImageVO>>(attachmapper.getAttachList(productNo), HttpStatus.OK);
		
	}
	
}
