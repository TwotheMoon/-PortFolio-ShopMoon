package org.shopmoon.domain;

import lombok.Data;

@Data
public class ContactVO {

	private String contactNo; // PK
	private String memberId; // FK
	private String contactTitle;
	private String contactContents;
	private String contactReply;
	private String contactAnswer;
	private String contactDate;
}
