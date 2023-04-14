package com.smf.shop.model.vo;

public class ProductAll {

	private String productName;
	private int categoryNo;
	private String brandName;
	private int companyPrice;
	private String productGender;
	private String productWeather;
	private String status;
	private int tradeCount;
	private int StockNo;
	private String userId;
	private int price;
	private int stock;
	private String size;
	private String userClass;
	private int imgNo;
	private String imgName;
	private String imgPath;
	private String imgStatus;
	private int postNo;
	private String productContent;
	private int pCategoryNo;
	private String pCategoryName;
	private int subCategoryNo;
	private String subCategoryName;
	private int wishListCount;
	private int postProductTagCount;
	
	public ProductAll() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductAll(String productName, int categoryNo, String brandName, int companyPrice, String productGender,
			String productWeather, String status, int tradeCount, int stockNo, String userId, int price, int stock,
			String size, String userClass, int imgNo, String imgName, String imgPath, String imgStatus, int postNo,
			String productContent, int pCategoryNo, String pCategoryName, int subCategoryNo, String subCategoryName,
			int wishListCount, int postProductTagCount) {
		super();
		this.productName = productName;
		this.categoryNo = categoryNo;
		this.brandName = brandName;
		this.companyPrice = companyPrice;
		this.productGender = productGender;
		this.productWeather = productWeather;
		this.status = status;
		this.tradeCount = tradeCount;
		StockNo = stockNo;
		this.userId = userId;
		this.price = price;
		this.stock = stock;
		this.size = size;
		this.userClass = userClass;
		this.imgNo = imgNo;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.imgStatus = imgStatus;
		this.postNo = postNo;
		this.productContent = productContent;
		this.pCategoryNo = pCategoryNo;
		this.pCategoryName = pCategoryName;
		this.subCategoryNo = subCategoryNo;
		this.subCategoryName = subCategoryName;
		this.wishListCount = wishListCount;
		this.postProductTagCount = postProductTagCount;
	}
	

	public ProductAll(String productName, String brandName, int companyPrice, String imgName, String imgPath,
			int wishListCount, int postProductTagCount) {
		super();
		this.productName = productName;
		this.brandName = brandName;
		this.companyPrice = companyPrice;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.wishListCount = wishListCount;
		this.postProductTagCount = postProductTagCount;
	}

	public ProductAll(String productName, int imgNo, String imgName, String imgPath, int subCategoryNo,
			String subCategoryName) {
		super();
		this.productName = productName;
		this.imgNo = imgNo;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.subCategoryNo = subCategoryNo;
		this.subCategoryName = subCategoryName;
	}

	public int getWishListCount() {
		return wishListCount;
	}

	public void setWishListCount(int wishListCount) {
		this.wishListCount = wishListCount;
	}

	public int getPostProductTagCount() {
		return postProductTagCount;
	}

	public void setPostProductTagCount(int postProductTagCount) {
		this.postProductTagCount = postProductTagCount;
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

	public int getStockNo() {
		return StockNo;
	}

	public void setStockNo(int stockNo) {
		StockNo = stockNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUserClass() {
		return userClass;
	}

	public void setUserClass(String userClass) {
		this.userClass = userClass;
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

	public int getpCategoryNo() {
		return pCategoryNo;
	}

	public void setpCategoryNo(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}

	public String getpCategoryName() {
		return pCategoryName;
	}

	public void setpCategoryName(String pCategoryName) {
		this.pCategoryName = pCategoryName;
	}

	public int getSubCategoryNo() {
		return subCategoryNo;
	}

	public void setSubCategoryNo(int subCategoryNo) {
		this.subCategoryNo = subCategoryNo;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	@Override
	public String toString() {
		return "ProductAll [productName=" + productName + ", categoryNo=" + categoryNo + ", brandName=" + brandName
				+ ", companyPrice=" + companyPrice + ", productGender=" + productGender + ", productWeather="
				+ productWeather + ", status=" + status + ", tradeCount=" + tradeCount + ", StockNo=" + StockNo
				+ ", userId=" + userId + ", price=" + price + ", stock=" + stock + ", size=" + size + ", userClass="
				+ userClass + ", imgNo=" + imgNo + ", imgName=" + imgName + ", imgPath=" + imgPath + ", imgStatus="
				+ imgStatus + ", postNo=" + postNo + ", productContent=" + productContent + ", pCategoryNo="
				+ pCategoryNo + ", pCategoryName=" + pCategoryName + ", subCategoryNo=" + subCategoryNo
				+ ", subCategoryName=" + subCategoryName + ", wishListCount=" + wishListCount + ", postProductTagCount="
				+ postProductTagCount + "]";
	}

}