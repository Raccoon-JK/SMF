package com.smf.shop.model.vo;

public class Stock {

	private int StockNo;
	private String userId;
	private String productName;
	private int price;
	private int stock;
	private String size;
	private String status;
	private String userClass;

	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stock(int stockNo, String userId, String productName, int price, int stock, String size, String status,
			String userClass) {
		super();
		StockNo = stockNo;
		this.userId = userId;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.size = size;
		this.status = status;
		this.userClass = userClass;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserClass() {
		return userClass;
	}

	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}

	@Override
	public String toString() {
		return "Stock [StockNo=" + StockNo + ", userId=" + userId + ", productName=" + productName + ", price=" + price
				+ ", stock=" + stock + ", size=" + size + ", status=" + status + ", userClass=" + userClass + "]";
	}
	
	
}
