package org.shopmoon.service;

import org.shopmoon.domain.MemberVO;

public interface MemberService {

	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;
}
