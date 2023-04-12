package com.smf.shop.model.vo;

public class Category_Sub {

	private int pCategoryNo;
	private String pCategoryName;
	private int subCategoryNo;
	private String subCategoryName;

	public Category_Sub() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category_Sub(int pCategoryNo, String pCategoryName, int subCategoryNo, String subCategoryName) {
		super();
		this.pCategoryNo = pCategoryNo;
		this.pCategoryName = pCategoryName;
		this.subCategoryNo = subCategoryNo;
		this.subCategoryName = subCategoryName;
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
		return "Category [pCategoryNo=" + pCategoryNo + ", pCategoryName=" + pCategoryName + ", subCategoryNo="
				+ subCategoryNo + ", subCategoryName=" + subCategoryName + "]";
	}

}
