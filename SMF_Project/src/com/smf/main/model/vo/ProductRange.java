package com.smf.main.model.vo;

public class ProductRange {
	private int startRange; // 새롭게 추가될 행의 시작
	private int endRange; // 새롭게 추가될 행의 끝
	private int currentRange; // 현재 저장된 행
	private int productLimit; // 보여줄 행 제한 (3행)	
	
	public ProductRange() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductRange(int startRange, int endRange, int currentRange, int productLimit) {
		super();
		this.startRange = startRange;
		this.endRange = endRange;
		this.currentRange = currentRange;
		this.productLimit = productLimit;
	}

	public int getStartRange() {
		return startRange;
	}
	public void setStartRange(int startRange) {
		this.startRange = startRange;
	}
	public int getEndRange() {
		return endRange;
	}
	public void setEndRange(int endRange) {
		this.endRange = endRange;
	}
	public int getCurrentRange() {
		return currentRange;
	}
	public void setCurrentRange(int currentRange) {
		this.currentRange = currentRange;
	}
	
	public int getProductLimit() {
		return productLimit;
	}
	public void setProductLimit(int productLimit) {
		this.productLimit = productLimit;
	}
	@Override
	public String toString() {
		return "ProductRange [startRange=" + startRange + ", endRange=" + endRange + ", currentRange=" + currentRange
				+ ", productLimit=" + productLimit + "]";
	}
	
	
}
