package org.shopmoon.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {

		@Autowired
		private AdminService adminservice;
		
		// 상품 등록 & 상품 이미지 등록 테스트
		@Test
		public void productEnrollTests() throws Exception{
			
			ProductVO product = new ProductVO();
			product.setProductName("큰일났다 완전 큰일이다");
			product.setProductCategory("기타");
			product.setProductPrice(5500);
			product.setProductStock(100);
			product.setProductContents("상품 내용");
			product.setProductActive("Y");
			product.setProductBest("Y");
			
			List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
			
			AttachImageVO image1 = new AttachImageVO();
			
			image1.setFileName("test Image 1");
			image1.setUploadPath("test image 1");
			image1.setUuid("test1111");
			
			imageList.add(image1);
			
			adminservice.productEnroll(product);
			
			System.out.println("등록된 VO : " + product);
			
			
		}
}
