package org.shopmoon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long replyNo;		// PK
	private String memberId;	// FK
	private Long contactNo;		// FK
	private String replyContents;
	private Date replyRegDate;
	private Date replyUpdateDate;
	
}
