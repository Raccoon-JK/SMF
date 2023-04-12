package com.smf.style.model.vo;

public class PostProducttag {
	
	private int postProducttagId;	//	POST_PRODUCTTAG_ID
	private int orderNo;			//	ORDER_NO
	private int postNo;				//	POST_NO
	
	public PostProducttag() {
		super();
	}

	public PostProducttag(int postProducttagId, int orderNo, int postNo) {
		super();
		this.postProducttagId = postProducttagId;
		this.orderNo = orderNo;
		this.postNo = postNo;
	}

	public int getPostProducttagId() {
		return postProducttagId;
	}

	public void setPostProducttagId(int postProducttagId) {
		this.postProducttagId = postProducttagId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "PostProducttag [postProducttagId=" + postProducttagId + ", orderNo=" + orderNo + ", postNo=" + postNo
				+ "]";
	}
	
	
}
