package org.shopmoon.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ContactMapperTests {

	@Autowired
	private ContactMapper contactmapper;

	@Test
	public void contactListTest() {
		
		Criteria cri = new Criteria(3,10);
		cri.setKeyword("제목");

		List<ContactVO> list = contactmapper.contactList(cri);
		
		 list.forEach(board -> log.info(board));
	        
	    }
		
}

