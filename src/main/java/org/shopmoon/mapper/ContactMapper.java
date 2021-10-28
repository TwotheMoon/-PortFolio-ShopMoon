package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;

public interface ContactMapper {

	// 문의 글 등록
	public void contactWrite(ContactVO contact);
	
	// 모든 문의 글 조회
	public List<ContactVO> contactGetList(Criteria cri);
}
