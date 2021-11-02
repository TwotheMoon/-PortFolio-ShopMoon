package org.shopmoon.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


public class ProductVO {

	private Long productNo; // PK
	private String productName;
	private String productCategory;
	private int productPrice;
	private int productStock;
	private String productContents;
	private String productActive;
	private String productBest;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date productRegDate;
	private Date productUpdateDate;
	
	private List<AttachImageVO> imageList;

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductContents() {
		return productContents;
	}

	public void setProductContents(String productContents) {
		this.productContents = productContents;
	}

	public String getProductActive() {
		return productActive;
	}

	public void setProductActive(String productActive) {
		this.productActive = productActive;
	}

	public String getProductBest() {
		return productBest;
	}

	public void setProductBest(String productBest) {
		this.productBest = productBest;
	}

	public Date getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}

	public Date getProductUpdateDate() {
		return productUpdateDate;
	}

	public void setProductUpdateDate(Date productUpdateDate) {
		this.productUpdateDate = productUpdateDate;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	
	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productCategory="
				+ productCategory + ", productPrice=" + productPrice + ", productStock=" + productStock
				+ ", productContents=" + productContents + ", productActive=" + productActive + ", productBest="
				+ productBest + ", productRegDate=" + productRegDate + ", productUpdateDate=" + productUpdateDate
				+ ", imageList=" + imageList + "]";
	}

}
