package org.shopmoon.service;

import javax.servlet.http.HttpServletResponse;

import org.shopmoon.domain.MemberVO;

public interface MemberService {

	
	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	// 회원 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	// 회원 수정
	public void memberUpdate(MemberVO member) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO member) throws Exception;
	
	// 회원 아이디 찾기
	public MemberVO memberFindId(String memberEmail) throws Exception;
	
	// 이메일 찾기
	public void sendEmail(MemberVO vo, String div) throws Exception;
	
	// 회원 비밀번호 찾기
	public void memberFindPw(HttpServletResponse response, MemberVO member) throws Exception;
	
	
}
