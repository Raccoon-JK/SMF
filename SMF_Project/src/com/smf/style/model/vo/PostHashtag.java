package com.smf.style.model.vo;

public class PostHashtag {

	private int postNo;			//	POST_NO
	private String hashtagId;	//	HASHTAG_ID
	
	public PostHashtag() {
		super();
	}

	public PostHashtag(int postNo, String hashtagId) {
		super();
		this.postNo = postNo;
		this.hashtagId = hashtagId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getHashtagId() {
		return hashtagId;
	}

	public void setHashtagId(String hashtagId) {
		this.hashtagId = hashtagId;
	}

	@Override
	public String toString() {
		return "PostHashtag [postNo=" + postNo + ", hashtagId=" + hashtagId + "]";
	}
	
	

}
