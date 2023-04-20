package com.smf.shop.model.vo;

public class Product {

	private String productName;
	private int categoryNo;
	private String brandName;
	private int companyPrice;
	private String productGender;
	private String productWeather;
	private String status;
	private int tradeCount;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productName, int categoryNo, String brandName, int companyPrice,
			String productGender, String productWeather, String status, int tradeCount) {
		super();
		this.productName = productName;
		this.categoryNo = categoryNo;
		this.brandName = brandName;
		this.companyPrice = companyPrice;
		this.productGender = productGender;
		this.productWeather = productWeather;
		this.status = status;
		this.tradeCount = tradeCount;
	}
	
	public Product(String productName, String brandName, int companyPrice) {
		super();
		this.productName = productName;
		this.brandName = brandName;
		this.companyPrice = companyPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getCompanyPrice() {
		return companyPrice;
	}

	public void setCompanyPrice(int companyPrice) {
		this.companyPrice = companyPrice;
	}

	public String getProductGender() {
		return productGender;
	}

	public void setProductGender(String productGender) {
		this.productGender = productGender;
	}

	public String getProductWeather() {
		return productWeather;
	}

	public void setProductWeather(String productWeather) {
		this.productWeather = productWeather;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTradeCount() {
		return tradeCount;
	}

	public void setTradeCount(int tradeCount) {
		this.tradeCount = tradeCount;
	}

	@Override
	public String toString() {
		return "Product [productName=" + productName + ", categoryNo=" + categoryNo + ", brandName=" + brandName
				+ ", companyPrice=" + companyPrice + ", productGender="
				+ productGender + ", productWeather=" + productWeather + ", status=" + status + ", tradeCount="
				+ tradeCount + "]";
	}

}
