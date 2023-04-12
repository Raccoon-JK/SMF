package com.smf.shop.model.vo;

public class Product_Detail {

	private String productName;
	private int postNo;
	private String productContent;

	public Product_Detail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product_Detail(String productName, int postNo, String productContent) {
		super();
		this.productName = productName;
		this.postNo = postNo;
		this.productContent = productContent;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	@Override
	public String toString() {
		return "Product_Detail [productName=" + productName + ", postNo=" + postNo + ", productContent="
				+ productContent + "]";
	}

}
