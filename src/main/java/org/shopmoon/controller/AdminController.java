package org.shopmoon.controller;

import org.shopmoon.domain.ProductVO;
import org.shopmoon.service.AdminService;
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

	private AdminService adminservice;
	
	@RequestMapping("/adminMain")
	public void adminMain() throws Exception{
		
		log.info("관리자 페이지 이동");
	}
	
	
	@RequestMapping("/productEnroll")
	public void productEnrollPOST(ProductVO product, RedirectAttributes rttr) throws Exception {
		
		log.info(" 상품 등록 중");
		
		//adminservice.productEnroll(product);
		
		//rttr.addFlashAttribute("enroll_result", product.getProductName());
		
	}
	
}
