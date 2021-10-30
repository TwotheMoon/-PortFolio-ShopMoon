package org.shopmoon.service;

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
public class ContactServiceTestes {
	
	@Autowired
	private ContactService contactservice;

	@Test
	public void contactGetListTest() throws Exception {
		Criteria cri = new Criteria();
		
		List list = contactservice.contactGetList(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void contactGetDetail() throws Exception{
		long contactNo = 250L;
		
		log.info(contactservice.contactGetDetail(contactNo));
	}
}
