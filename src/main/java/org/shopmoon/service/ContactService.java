package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;

public interface ContactService {

	// 문의 글 등록
	public void contactWrite(ContactVO contact) throws Exception;
	
	// 문의 글 목록
	public List<ContactVO> contactGetList(Criteria cri) throws Exception;
	
	// 문의 글 총 수
	public int contactGetTotal(Criteria cri) throws Exception;

	// 문의 글 내용 상세 페이지
	public ContactVO contactGetDetail(Long contactNo) throws Exception;
	
	// 문의 글 수정
	public int contactModify(ContactVO contact) throws Exception;
	
	// 문의 글 삭제
	public int contactDelete(Long contactNo) throws Exception;
	
}
