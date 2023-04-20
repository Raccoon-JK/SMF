package com.smf.admin.model.vo;

import java.sql.Date;

public class Black {
	
	
	private int BlackNo;
	private String UserId;
	private Date BlackDate;
	private String Status;
	
	
	
	public Black(int blackNo, String userId, Date blackDate, String status) {
		super();
		BlackNo = blackNo;
		UserId = userId;
		BlackDate = blackDate;
		Status = status;
	}
	
	
	
	public int getBlackNo() {
		return BlackNo;
	}
	public void setBlackNo(int blackNo) {
		BlackNo = blackNo;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public Date getBlackDate() {
		return BlackDate;
	}
	public void setBlackDate(Date blackDate) {
		BlackDate = blackDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
	@Override
	public String toString() {
		return "Black [BlackNo=" + BlackNo + ", UserId=" + UserId + ", BlackDate=" + BlackDate + ", Status=" + Status
				+ "]";
	}
	
	
	
}
