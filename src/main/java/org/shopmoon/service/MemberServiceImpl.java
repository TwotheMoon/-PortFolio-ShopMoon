package org.shopmoon.service;

import org.shopmoon.domain.MemberVO;
import org.shopmoon.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;
	
	// 회원등록
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {

		return membermapper.memberLogin(member);
	}
	
	@Override
	public void memberUpdate(MemberVO member) throws Exception {
		
		membermapper.memberUpdate(member);
	}
	
	@Override
	public void memberDelete(MemberVO member) throws Exception {

		membermapper.memberDelete(member);
	}
	
	@Override
	public MemberVO memberFindId(String memberEmail) throws Exception {
		
		return membermapper.memberFindId(memberEmail);	
		
	}
	
//	@Override
//	public MemberVO memberFindPw(String memberPhone) throws Exception {
//
//		return membermapper.memberFindPw(memberPhone);
//	}
	

}
