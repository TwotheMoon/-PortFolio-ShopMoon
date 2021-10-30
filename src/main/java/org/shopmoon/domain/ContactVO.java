package org.shopmoon.domain;

import lombok.Data;

@Data
public class ContactVO {

	private Long contactNo; // PK
	private String memberId;
	private String contactCategory;
	private String contactTitle;
	private String contactContents;
	private String contactReply;
	private String contactAnswer;
	private String contactDate;
}
