package com.smf.my.model.vo;

public class WishList {
	private String userId;
	private String productName;
	
	public WishList() {
		super();
	}

	public WishList(String userId, String productName) {
		super();
		this.userId = userId;
		this.productName = productName;
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

	@Override
	public String toString() {
		return "WishList [userId=" + userId + ", productName=" + productName + "]";
	}
	
}
