package com.smf.shop.model.vo;

public class ProductAll {
	private String productName;	   //	PRODUCT_NAME
	private int categoryNo;	  	   //	CATEGORY_NO
	private String brandName;	   //	BRAND_NAME
	private String companyPrice;   //	COMPANY_PRICE
	private String productGender;  //	PRODUCT_GENDER
	private String prdouctWeather; //	PRODUCT_WEATHER
	private String status;		   //	STATUS
	private int imgNo;		       //	IMG_NO
	private String imgName;		   //	IMG_NAME
	private String imgPath;		   //	IMG_PATH
	private String imgStatus;	   //	IMG_STATUS
	
	public ProductAll() {
		super();
	}

	public ProductAll(String productName, int categoryNo, String brandName, String companyPrice, String productGender,
			String prdouctWeather, String status, int imgNo, String imgName, String imgPath, String imgStatus) {
		super();
		this.productName = productName;
		this.categoryNo = categoryNo;
		this.brandName = brandName;
		this.companyPrice = companyPrice;
		this.productGender = productGender;
		this.prdouctWeather = prdouctWeather;
		this.status = status;
		this.imgNo = imgNo;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.imgStatus = imgStatus;
	}
	
	public ProductAll(String productName, String brandName, String imgName, String imgPath) {
		super();
		this.productName = productName;
		this.brandName = brandName;
		this.imgName = imgName;
		this.imgPath = imgPath;
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

	public String getCompanyPrice() {
		return companyPrice;
	}

	public void setCompanyPrice(String companyPrice) {
		this.companyPrice = companyPrice;
	}

	public String getProductGender() {
		return productGender;
	}

	public void setProductGender(String productGender) {
		this.productGender = productGender;
	}

	public String getPrdouctWeather() {
		return prdouctWeather;
	}

	public void setPrdouctWeather(String prdouctWeather) {
		this.prdouctWeather = prdouctWeather;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
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
		return "ProductAll [productName=" + productName + ", categoryNo=" + categoryNo + ", brandName=" + brandName
				+ ", companyPrice=" + companyPrice + ", productGender=" + productGender + ", prdouctWeather="
				+ prdouctWeather + ", status=" + status + ", imgNo=" + imgNo + ", imgName=" + imgName + ", imgPath="
				+ imgPath + ", imgStatus=" + imgStatus + "]";
	}
}
