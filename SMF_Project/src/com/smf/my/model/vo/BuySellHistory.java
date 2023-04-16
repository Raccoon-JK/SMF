package com.smf.my.model.vo;

import java.sql.Date;

public class BuySellHistory {
	private int orderNo;
    private int orderPno;
    private int stockNo;
    private int imgNo;
    private String userId;
    private int addressNo;
    private int orderCount;
    private Date orderDate;
    private int amount;
    private int totalAmount;
    private String productName;
    private String brandName;
    private String pSize;
    private int postcode;
    private String address;
    private String imgPath;
    private String imgName;
    
	public BuySellHistory() {
		super();
	}



	public BuySellHistory(int orderNo, int orderPno, int stockNo, int imgNo, String userId, int addressNo, int orderCount,
			Date orderDate, int amount, int totalAmount, String productName, String brandName, String pSize,
			int postcode, String address, String imgPath, String imgName) {
		super();
		this.orderNo = orderNo;
		this.orderPno = orderPno;
		this.stockNo = stockNo;
		this.imgNo = imgNo;
		this.userId = userId;
		this.addressNo = addressNo;
		this.orderCount = orderCount;
		this.orderDate = orderDate;
		this.amount = amount;
		this.totalAmount = totalAmount;
		this.productName = productName;
		this.brandName = brandName;
		this.pSize = pSize;
		this.postcode = postcode;
		this.address = address;
		this.imgPath = imgPath;
		this.imgName = imgName;
	}

	// 리스트 안 상품정보



	public int getOrderNo() {
		return orderNo;
	}

	public BuySellHistory(int orderNo, int orderPno, int orderCount, Date orderDate, int amount,
			String productName, String brandName, String pSize, int postcode, String address, String imgPath,
			String imgName) {
		super();
		this.orderNo = orderNo;
		this.orderPno = orderPno;
		this.orderCount = orderCount;
		this.orderDate = orderDate;
		this.amount = amount;
		this.productName = productName;
		this.brandName = brandName;
		this.pSize = pSize;
		this.postcode = postcode;
		this.address = address;
		this.imgPath = imgPath;
		this.imgName = imgName;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderPno() {
		return orderPno;
	}

	public void setOrderPno(int orderPno) {
		this.orderPno = orderPno;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
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

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public int getPostcode() {
		return postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "BuySellHistory [orderNo=" + orderNo + ", orderPno=" + orderPno + ", stockNo=" + stockNo + ", imgNo="
				+ imgNo + ", userId=" + userId + ", addressNo=" + addressNo + ", orderCount=" + orderCount
				+ ", orderDate=" + orderDate + ", amount=" + amount + ", totalAmount=" + totalAmount + ", productName="
				+ productName + ", brandName=" + brandName + ", pSize=" + pSize + ", postcode=" + postcode
				+ ", address=" + address + ", imgPath=" + imgPath + ", imgName=" + imgName + "]";
	}
    
}
