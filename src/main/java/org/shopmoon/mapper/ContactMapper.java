package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;

public interface ContactMapper {

	// 문의 글 등록
	public void contactWrite(ContactVO contact);
	
	// 문의 글 리스트
	public List<ContactVO> contactGetList(Criteria cri);
	
	// 문의 글 총 수
	public int contactGetTotal(Criteria cri);
	
	// 문의 글 내용 상세 페이지
	public ContactVO contactGetDetail(Long contactNo);
	
	// 문의 글 수정
	public int contactModify(ContactVO contact);

	// 문의 글 삭제
	public int contactDelete(Long contactNo);
}
