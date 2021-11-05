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

		List list = contactmapper.contactGetList(cri);
		
		 list.forEach(board -> log.info(board));
	        
	    }
	
	
	@Test
	public void contactGetTotalTest() throws Exception {
		
		Criteria cri = new Criteria();
		cri.setKeyword("qwer");
		
		int total = contactmapper.contactGetTotal(cri);
		
		log.info("total.. " + total);
	}
	
	@Test
	public void contactGetDetail() throws Exception{
		
		Long contactNo = 250L;
		
		contactmapper.contactGetDetail(contactNo);
		
		log.info(contactNo);
		
	}
	
	@Test
	public void contactModifyTest() {
		
		ContactVO contact = new ContactVO();
				
		contact.setContactNo(249L);
		System.out.println("수정 전...................." + contactmapper.contactGetDetail(contact.getContactNo()));
		
		contact.setContactTitle("문의 제목 수정 하였습니다.");
		
		contactmapper.contactModify(contact);
		System.out.println("수정 후...................." + contactmapper.contactGetDetail(contact.getContactNo()));
		
	}
	
	@Test
	public void contactGetMemberIdTest() throws Exception {
		
		Long contactNo = 252L;
		 
		contactmapper.contactGetMemberId(contactNo);
	}
		
}

