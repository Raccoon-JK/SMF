package com.smf.admin.model.vo;

import java.sql.Date;

public class Notice {
	
	//ALERT_NO
	//ALERT_CATEGORY
	//ALERT_TITLE
	//ALERT_CONTENT
	//CREATE_DATE
	//LEVEL
	
	private int AlertNo;
	private String AlertCategory;
	private String AlertTitle;
	private String AlertContent;
	private Date CreateDate;
	private String QLevel;

	
	public Notice(int alertNo, String alertCategory, String alertTitle, String alertContent, Date createDate,
		String qlevel) {
	super();
	AlertNo = alertNo;
	AlertCategory = alertCategory;
	AlertTitle = alertTitle;
	AlertContent = alertContent;
	CreateDate = createDate;
	QLevel = qlevel;
}
	
	
	
	public Notice(int alertNo, String alertCategory, String alertTitle, Date createDate, String qLevel) {
		super();
		AlertNo = alertNo;
		AlertCategory = alertCategory;
		AlertTitle = alertTitle;
		CreateDate = createDate;
		QLevel = qLevel;
}
	


	public Notice(int alertNo, String alertCategory, String alertTitle, String alertContent, Date createDate) {
		super();
		AlertNo = alertNo;
		AlertCategory = alertCategory;
		AlertTitle = alertTitle;
		AlertContent = alertContent;
		CreateDate = createDate;
	}
	
	



	public Notice() {
		super();
	}
	public int getAlertNo() {
		return AlertNo;
	}
	public void setAlertNo(int alertNo) {
		AlertNo = alertNo;
	}
	public String getAlertCategory() {
		return AlertCategory;
	}
	public void setAlertCategory(String alertCategory) {
		AlertCategory = alertCategory;
	}
	public String getAlertTitle() {
		return AlertTitle;
	}
	public void setAlertTitle(String alertTitle) {
		AlertTitle = alertTitle;
	}
	public String getAlertContent() {
		return AlertContent;
	}
	public void setAlertContent(String alertContent) {
		AlertContent = alertContent;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public String getQLevel() {
		return QLevel;
	}
	public void setLevel(String qLevel) {
		QLevel = qLevel;
	}
	@Override
	public String toString() {
		return "Notice [AlertNo=" + AlertNo + ", AlertCategory=" + AlertCategory + ", AlertTitle=" + AlertTitle
				+ ", AlertContent=" + AlertContent + ", CreateDate=" + CreateDate + ", QLevel=" + QLevel + "]";
	}
}