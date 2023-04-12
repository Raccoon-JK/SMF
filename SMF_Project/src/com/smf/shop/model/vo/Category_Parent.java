package com.smf.shop.model.vo;

public class Category_Parent {

	private int pCategoryNo;
	private String pCategoryName;

	public Category_Parent() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category_Parent(int pCategoryNo, String pCategoryName) {
		super();
		this.pCategoryNo = pCategoryNo;
		this.pCategoryName = pCategoryName;
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

	@Override
	public String toString() {
		return "Category_Parent [pCategoryNo=" + pCategoryNo + ", pCategoryName=" + pCategoryName + "]";
	}

}
