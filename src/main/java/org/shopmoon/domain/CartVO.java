package org.shopmoon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNo; 	// PK
	private Long memberId;  // FK
	private Long productNo; // FK
	private int cartQuantity;
	private Date cartRegDate;
	
}
