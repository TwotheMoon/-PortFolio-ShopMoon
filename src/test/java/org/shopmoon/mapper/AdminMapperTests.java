package org.shopmoon.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
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
		
		product.setProductName("앨범1");
		product.setProductCategory("앨범");
		product.setProductPrice(10500);
		product.setProductStock(10);
		product.setProductContents("상품 설명");
		product.setProductImg("이미지 없음");
		
		adminmapper.productEnroll(product);
	
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
		

	
}
