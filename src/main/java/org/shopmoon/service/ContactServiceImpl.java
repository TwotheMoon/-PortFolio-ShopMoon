package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ContactServiceImpl implements ContactService{

	@Autowired
	ContactMapper contactmapper;
	
	
	@Override // 문의 글 등록
	public void contactWrite(ContactVO contact) throws Exception {

		contactmapper.contactWrite(contact);
	}
	
	@Override
	public List<ContactVO> contactGetList(Criteria cri) throws Exception {

		log.info("(service) contactGetList 가져오는중....." + cri);
		
		return contactmapper.contactGetList(cri);
	}
	
	@Override
	public int contactGetTotal(Criteria cri) throws Exception {
		
		log.info("(service) contactGetTotal 가져오는중....." + cri);
		
		return contactmapper.contactGetTotal(cri);
	}
	
	@Override
	public ContactVO contactGetDetail(Long contactNo) throws Exception {
		
		return contactmapper.contactGetDetail(contactNo);
	}
	
	@Override
	public int contactModify(ContactVO contact) throws Exception {

		return contactmapper.contactModify(contact);
	}

}
