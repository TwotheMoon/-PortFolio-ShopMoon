package org.shopmoon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNo; 	// PK
	private String memberId;  // FK
	private Long productNo; // FK
	private int productPrice;
	private int cartQuantity;
	private Date cartRegDate;
	private Date cartUpdateDate;
	
}
