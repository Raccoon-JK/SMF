package com.smf.shop.model.vo;

public class Product_Img {
	
	private int imgNo;
	private String productName;
	private String imgName;
	private String imgPath;
	private String imgStatus;

	public Product_Img() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product_Img(int imgNo, String productName, String imgName, String imgPath, String imgStatus) {
		super();
		this.imgNo = imgNo;
		this.productName = productName;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.imgStatus = imgStatus;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	@Override
	public String toString() {
		return "Product_Img [imgNo=" + imgNo + ", productName=" + productName + ", imgName=" + imgName + ", imgPath="
				+ imgPath + ", imgStatus=" + imgStatus + "]";
	}
	
}