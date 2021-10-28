package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;

public interface ContactService {

	// 문의 글 등록
	public void contactWrite(ContactVO contact) throws Exception;
	
	// 문의 글 목록
	public List<ContactVO> contactGetList(Criteria cri) throws Exception;
}
