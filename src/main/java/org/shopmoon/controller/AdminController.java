package org.shopmoon.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.swing.ListModel;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.PageDTO;
import org.shopmoon.domain.ProductVO;
import org.shopmoon.mapper.AttachMapper;
import org.shopmoon.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private AdminService adminservice;
	@Autowired
	private AttachMapper attachmapper;
	
	// 관리자 페이지 메인
	@RequestMapping("/adminMain")
	public void adminMain() {
		
		log.info("관리자 페이지 이동");
	}
	
	
	// 상품 등록 페이지 이동
	@RequestMapping("/productEnrollView")
	public void productEnroll() throws Exception {
		log.info(" 상품 등록 페이지 이동");
		
	}
	
	// 상품 등록 메소드
	@PostMapping("/productEnroll")
	public String productEnrollPOST(ProductVO product, RedirectAttributes rttr) throws Exception {
		
		log.info("상품 등록 메소드 진입" + product);
		
		adminservice.productEnroll(product);
		
		String result = product.getProductName();
		
		rttr.addFlashAttribute("enroll_result", result);
		
		log.info("상품 등록 메소드 실행 완료");
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
	
	// 상품 정보 삭제
	@PostMapping("/productDelete")
	public String productDeletePOST(Long productNo , RedirectAttributes rttr) throws Exception {
		
		int result = adminservice.productDelete(productNo);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/productList";
		
	}
	
	// 첨부 파일 업로드 
	@PostMapping(value = "/uploadAjaxImg", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxImgPOST(MultipartFile[] uploadFile) {
		
		log.info("첨부 파일 업로드 중");
		
		// 이미지 파일 체크
		for(MultipartFile multipartFile : uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}
		
		String uploadFolder = "C:\\shopMoonUpload";
		
		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성 
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// 이미지 정보 담는 객체
		List<AttachImageVO> list = new ArrayList();
			
		for(MultipartFile multipartFile : uploadFile) {
			
			// 이미지 정보 객체
			AttachImageVO attachImg = new AttachImageVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			attachImg.setFileName(uploadFileName);
			attachImg.setUploadPath(datePath);
			
			// uuid 적용
			String uuid = UUID.randomUUID().toString();
			attachImg.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
				
				// 썸네일 생성
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bufferImg = ImageIO.read(saveFile);
				
				double ratio = 3;
				int width = (int)(bufferImg.getWidth() / ratio);
				int height = (int)(bufferImg.getHeight() / ratio);
				
				BufferedImage newBufferImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = newBufferImg.createGraphics();
				graphic.drawImage(bufferImg, 0, 0,width,height, null);
				
				ImageIO.write(newBufferImg, "jpg", thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(attachImg);
		} // for
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	// 이미지 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		File file = null;
		
		try {
			// 썸네일 파일 삭제
			file = new File("c:\\shopMoonUpload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			String originFileName = file.getAbsolutePath().replace("s_", "");
			file = new File(originFileName);
			file.delete();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	
	// 이미지 정보 반환
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(Long productNo){
		
		log.info("/getAttachList... " + productNo);
		
		return new ResponseEntity<List<AttachImageVO>>(attachmapper.getAttachList(productNo), HttpStatus.OK);
		
	}
	
	
}
	
