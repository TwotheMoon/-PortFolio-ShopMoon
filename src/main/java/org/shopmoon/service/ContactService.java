package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;

public interface ContactService {

	// 문의 글 등록
	public void contactWrite(ContactVO contact) throws Exception;
	

}
