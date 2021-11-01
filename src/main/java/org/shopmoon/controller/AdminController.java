package org.shopmoon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.PageDTO;
import org.shopmoon.domain.ProductVO;
import org.shopmoon.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	// 관리자 페이지 메인
	@RequestMapping("/adminMain")
	public void adminMain() {
		
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
	
	// 상품 관리(목록) 페이지 이동 및 조회
		@RequestMapping(value = "productList", method = RequestMethod.GET)
		public void productList(Criteria cri, Model model) throws Exception{
			
			log.info("상품 관리 이동");
			
			List list = adminservice.productGetList(cri);
			
			// 키워드 검색 결과
			if(!list.isEmpty()) {
				model.addAttribute("list",list);
			} else {
				model.addAttribute("listCheck", "empty");
				return;
			}
			
			model.addAttribute("pageMaker", new PageDTO(cri, adminservice.productGetTotal(cri)));
		}
		
	// 상품 조회 상세 페이지 , 수정 페이지
	@RequestMapping({"/productDetail", "/productModify"})
	public void productGetDetail(long productNo, Criteria cri, Model model, HttpServletRequest request) throws Exception {
		log.info("문의 글 상세 페이지 진입");
		
		// 페이지 정보
		model.addAttribute("cri", cri);
		//
		model.addAttribute("productInfo", adminservice.productGetDetail(productNo));
		
	}
	
	// 상품 정보 수정 메소드
	@PostMapping("/productModify")
	public String productModifyPOST(ProductVO product, RedirectAttributes rttr) throws Exception{
		
		log.info("authorModifyPOST......." + product);
		
		int result = adminservice.productModify(product);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/productList";
		
	}
	
	/* 상품 정보 삭제 */
	@PostMapping("/productDelete")
	public String productDeletePOST(Long productNo , RedirectAttributes rttr) throws Exception {
		
		int result = adminservice.productDelete(productNo);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/productList";
		
	}
		
	
	
}
