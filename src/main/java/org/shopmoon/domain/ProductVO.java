package org.shopmoon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private Long productNo; // PK
	private String productName;
	private String productCategory;
	private int productPrice;
	private int productStock;
	private String productContents;
	private String productImg;
	private String productActive;
	private String productBest;
	private Date productRegDate;
	private Date productUpdateDate;
}
