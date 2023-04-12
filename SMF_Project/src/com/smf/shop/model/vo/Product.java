package com.smf.shop.model.vo;

public class Product {

	private String productName;
	private int categoryNo;
	private String brandName;
	private String productColor;
	private String productGender;
	private String productWeather;
	private String status;
	private int tradeCount;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productName, int categoryNo, String brandName, String productColor,
			String productGender, String productWeather, String status, int tradeCount) {
		super();
		this.productName = productName;
		this.categoryNo = categoryNo;
		this.brandName = brandName;
		this.productColor = productColor;
		this.productGender = productGender;
		this.productWeather = productWeather;
		this.status = status;
		this.tradeCount = tradeCount;
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

	public String getProductColor() {
		return productColor;
	}

	public void setProductColor(String productColor) {
		this.productColor = productColor;
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
				+ ", productColor=" + productColor + ", productGender="
				+ productGender + ", productWeather=" + productWeather + ", status=" + status + ", tradeCount="
				+ tradeCount + "]";
	}

}
