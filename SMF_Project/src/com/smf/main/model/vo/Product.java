package com.smf.main.model.vo;

public class Product {
	private String productName;
	private int companyPrice;
	private String imageName;
	private String imagePath;
	private String brandName;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String productName, int companyPrice, String imageName, String imagePath, String brandName) {
		super();
		this.productName = productName;
		this.companyPrice = companyPrice;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.brandName = brandName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCompanyPrice() {
		return companyPrice;
	}
	public void setCompanyPrice(int companyPrice) {
		this.companyPrice = companyPrice;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Override
	public String toString() {
		return "Product [productName=" + productName + ", companyPrice=" + companyPrice + ", imageName=" + imageName
				+ ", imagePath=" + imagePath + ", brandName=" + brandName + "]";
	}

	
}