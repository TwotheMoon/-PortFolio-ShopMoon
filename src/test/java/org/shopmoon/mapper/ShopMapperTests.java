package org.shopmoon.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ShopMapperTests {
	
	@Autowired
	ShopMapper shopmapper;
	
	@Test
	public void guitarGetListTests() {
		
	Criteria cri = new Criteria();
	
	cri.setKeyword("테스트");
	
	// 검색 리스트
	List list = shopmapper.guitarGetList(cri);
	
	for(int i = 0; i < list.size(); i++) {
		log.info(list.get(i));
	}
     
	// 기타 총 개수
	int result = shopmapper.guitarGetTotal(cri);
	log.info(result);
	 
	}
}
