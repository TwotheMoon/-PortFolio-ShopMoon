package org.shopmoon.controller;

import org.shopmoon.domain.ProductVO;
import org.shopmoon.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	// 관리자 페이지 이동
	@RequestMapping("/adminMain")
	public void adminMain() throws Exception{
		
		log.info("관리자 페이지 이동");
	}
	
	// 상품 등록 페이지 이동
	@RequestMapping("/productEnrollView")
	public void productEnroll() throws Exception {
		log.info(" 상품 등록 중");
		
	}
	
	// 상품 등록 메소드
	@PostMapping("/productEnroll")
	public String productEnrollPOST(ProductVO product, RedirectAttributes rttr) throws Exception {
		
		adminservice.productEnroll(product);
		
		String result = product.getProductName();
		
		rttr.addFlashAttribute("enroll_result", result);
		
		return "redirect:/admin/adminMain";
	}
	
}
