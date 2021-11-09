package org.shopmoon.mapper;

import org.shopmoon.domain.MemberVO;

public interface MemberMapper {

	// 회원가입
	public void memberJoin(MemberVO member);

	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	// 회원 로그인
	public MemberVO memberLogin(MemberVO member);
	
	// 회원 정보 수정
	public void memberUpdate(MemberVO member);
	
	// 회원 탈퇴
	public void memberDelete(MemberVO member);

	// 회원 아이디 찾기
	public MemberVO memberFindId(String memberEmail);
	
	// 회원 비밀번호 찾기
//	public MemberVO memberFindPw(String memberPhone);
}
