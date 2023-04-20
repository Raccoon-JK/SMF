package com.smf.style.model.vo;

public class PostLike {

	private String userId;	
	private int postNo;
	
	public PostLike() {
		super();
	}
	
	

	public PostLike(int postNo) {
		super();
		this.postNo = postNo;
	}



	public PostLike(String userId, int postNo) {
		super();
		this.userId = userId;
		this.postNo = postNo;
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

	@Override
	public String toString() {
		return "PostLike [userId=" + userId + ", postNo=" + postNo + "]";
	}
	
	
	
}
