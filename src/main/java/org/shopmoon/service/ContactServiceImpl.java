package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactServiceImpl implements ContactService{

	@Autowired
	ContactMapper contactmapper;
	
	
	@Override // 문의 글 등록
	public void contactWrite(ContactVO contact) throws Exception {

		contactmapper.contactWrite(contact);
	}
	

}
