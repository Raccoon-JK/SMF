package com.smf.style.model.vo;

public class Follow {
	
	private String userId;	//	USER_ID
	private String follower;	//	FOLLOWER
	
	public Follow() {
		super();
	}

	public Follow(String userId, String follower) {
		super();
		this.userId = userId;
		this.follower = follower;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	@Override
	public String toString() {
		return "Follow [userId=" + userId + ", follower=" + follower + "]";
	}
	
	
}
