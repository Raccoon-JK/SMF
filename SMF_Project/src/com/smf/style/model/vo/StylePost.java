package com.smf.style.model.vo;

import java.sql.Date;

public class StylePost {
	
	private int postNo;
	private String userId;
	private String content;
	private Date uproadTime;
	private String postStatus;
	
	private String titleImg;
	private String userImage;
	private String pLike;
	
	private PostImg pi;
	
	public StylePost(){
		super();
	}


	public StylePost(int postNo, String userId, String content, Date uproadTime, String postStatus) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.content = content;
		this.uproadTime = uproadTime;
		this.postStatus = postStatus;
	}
	


	public StylePost(int postNo, String userId, String content, Date uproadTime) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.content = content;
		this.uproadTime = uproadTime;
	}
	
	
	
	


	public String getpLike() {
		return pLike;
	}


	public void setpLike(String pLike) {
		this.pLike = pLike;
	}


	public String getUserImage() {
		return userImage;
	}


	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	public PostImg getPi() {
		return pi;
	}


	public void setPi(PostImg pi) {
		this.pi = pi;
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getUproadTime() {
		return uproadTime;
	}


	public void setUproadTime(Date uproadTime) {
		this.uproadTime = uproadTime;
	}


	public String getPostStatus() {
		return postStatus;
	}


	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}


	@Override
	public String toString() {
		return "StylePost [postNo=" + postNo + ", userId=" + userId + ", content=" + content + ", uproadTime="
				+ uproadTime + ", postStatus=" + postStatus + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
