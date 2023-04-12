package com.smf.my.model.vo;

public class ShoppingCart {
	private String userId;
	private String reseller;
	private int stockNo;
	private int stock;
	private int cartNo;
	private int imgNo;
	private String productName;
	private String brandName;
	private int price;
	private String size;
	private int cartCount;
	private String imgPath;
	private String imgName;
	private int status;
	
	public ShoppingCart() {
		super();
	}
	
	
	public ShoppingCart(String userId, String reseller, int stockNo, int stock, int cartNo, int imgNo,
			String productName, String brandName, int price, String size, int cartCount, String imgPath,
			String imgName, int status) {
		super();
		this.userId = userId;
		this.reseller = reseller;
		this.stockNo = stockNo;
		this.stock = stock;
		this.cartNo = cartNo;
		this.imgNo = imgNo;
		this.productName = productName;
		this.brandName = brandName;
		this.price = price;
		this.size = size;
		this.cartCount = cartCount;
		this.imgPath = imgPath;
		this.imgName = imgName;
		this.status = status;
	}

	public ShoppingCart(String reseller, int stockNo, int cartNo, String productName, String brandName, int price,
			String size, int cartCount, String imgPath, String imgName, int status) {
		super();
		this.reseller = reseller;
		this.stockNo = stockNo;
		this.cartNo = cartNo;
		this.productName = productName;
		this.brandName = brandName;
		this.price = price;
		this.size = size;
		this.cartCount = cartCount;
		this.imgPath = imgPath;
		this.imgName = imgName;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReseller() {
		return reseller;
	}

	public void setReseller(String reseller) {
		this.reseller = reseller;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	
	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ShoppingCart [userId=" + userId + ", reseller=" + reseller + ", stockNo=" + stockNo + ", stock=" + stock
				+ ", cartNo=" + cartNo + ", imgNo=" + imgNo + ", productName=" + productName + ", brandName="
				+ brandName + ", price=" + price + ", size=" + size + ", cartCount=" + cartCount + ", imgPath="
				+ imgPath + ", imgName=" + imgName + ", status="+status+"]";
	}
	
}
