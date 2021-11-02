package org.shopmoon.domain;

import lombok.Data;

@Data
public class AttachImageVO {

	private String uploadPath;
	private String uuid; // PK
	private String fileName;
	private Long productNo; // FK
}
