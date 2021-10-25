package org.shopmoon.domain;

import lombok.Data;


@Data
public class MemberVO {

	private Long memberNo;
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

}

