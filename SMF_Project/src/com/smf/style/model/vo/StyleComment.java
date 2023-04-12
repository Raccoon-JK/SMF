package com.smf.style.model.vo;

import java.sql.Date;

public class StyleComment {

	private int cNo;					//	C_NO
	private String userId;				//	USER_ID
	private int postNo; 				//	POST_NO
	private String cContent;			//	C_CONTENT
	private Date cUproadTime;			//	C_UPROADTIME
	private String cStatus;				//	C_STATUS
	
	public StyleComment() {
		super();
	}

	public StyleComment(int cNo, String userId, int postNo, String cContent, Date cUproadTime, String cStatus) {
		super();
		this.cNo = cNo;
		this.userId = userId;
		this.postNo = postNo;
		this.cContent = cContent;
		this.cUproadTime = cUproadTime;
		this.cStatus = cStatus;
	}
	
	

	public StyleComment(int cNo, String userId, String cContent, Date cUproadTime) {
		super();
		this.cNo = cNo;
		this.userId = userId;
		this.cContent = cContent;
		this.cUproadTime = cUproadTime;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcUproadTime() {
		return cUproadTime;
	}

	public void setcUproadTime(Date cUproadTime) {
		this.cUproadTime = cUproadTime;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "StyleComment [cNo=" + cNo + ", userId=" + userId + ", postNo=" + postNo + ", cContent=" + cContent
				+ ", cUproadTime=" + cUproadTime + ", cStatus=" + cStatus + "]";
	}
	
	
}
