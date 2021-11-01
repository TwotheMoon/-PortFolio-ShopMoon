package org.shopmoon.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date productRegDate;
	private Date productUpdateDate;
}
