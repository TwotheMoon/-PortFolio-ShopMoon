package org.shopmoon.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttachMapperTests {
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Test
	public void getAttachListTests() {
		
		Long productNo = 54L;
		
		System.out.println("이미지 정보 : " + attachMapper.getAttachList(productNo));
	
		log.info("이미지테이블 정보 가져옴.......................");
	}
}
