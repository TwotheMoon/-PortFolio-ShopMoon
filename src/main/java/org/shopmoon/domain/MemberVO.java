package org.shopmoon.domain;

import java.util.List;

import lombok.Data;


@Data
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberPostNum;
	private String memberAddr1;
	private String memberAddr2;
	private String memberActive;
	private String memberRegDate;
	private String memberAuthority;
	
	private ContactVO contactVO; // contact 테이블

}

