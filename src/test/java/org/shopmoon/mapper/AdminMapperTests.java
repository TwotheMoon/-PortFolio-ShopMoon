package org.shopmoon.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {

	@Autowired
	private AdminMapper adminmapper;

	@Test
	public void productEnrollTest() throws Exception {
		
		ProductVO product = new ProductVO();
		
		product.setProductName("테스트");
		product.setProductCategory("테스트");
		product.setProductPrice(10500);
		product.setProductStock(10);
		product.setProductContents("테스트 설명");
		product.setProductActive("Y");
		product.setProductBest("Y");
		
		System.out.println("Before productVO :" + product);
		
		adminmapper.productEnroll(product);
		log.info("등록 완료" + product);
	
		System.out.println("After productVO :" + product);
		}
	
	
	@Test
	public void productListTest() throws Exception {
		
		Criteria cri = new Criteria(1,10);

		List list = adminmapper.productGetList(cri);
		
		 list.forEach(board -> log.info(board));
	        
	    }
	
	
	@Test
	public void productGetTotalTest() throws Exception {
		
		Criteria cri = new Criteria();
		cri.setKeyword("qwe");
		
		int total = adminmapper.productGetTotal(cri);
		
		log.info("total.. " + total);
	}
	
	
	/* 상품 정보 삭제 */
	@Test
	public void productDeleteTest() throws Exception {
		
		Long productNo = 39L;
		
		int result = adminmapper.productDelete(productNo);
		
		if(result == 1) {
			System.out.println("삭제 성공");
		}
		
	}
	
	/* 이미지 등록 */
	@Test
	public void imageEnrollTest() throws Exception {
		
		AttachImageVO vo = new AttachImageVO();
		
		vo.setProductNo(21L);
		vo.setFileName("test");
		vo.setUploadPath("test");
		vo.setUuid("test4");
		
		adminmapper.imageEnroll(vo);
		
	}
		

	
}
