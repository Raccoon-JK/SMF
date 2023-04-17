package com.smf.main.model.vo;

public class MainStyle {
	private String snsId;
	private String userImage;
	private String imgPath;
	private String imgName;
	
	public MainStyle() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MainStyle(String snsId, String userImage, String imgPath, String imgName) {
		super();
		this.snsId = snsId;
		this.userImage = userImage;
		this.imgPath = imgPath;
		this.imgName = imgName;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	@Override
	public String toString() {
		return "Style [snsId=" + snsId + ", userImage=" + userImage + ", imgPath=" + imgPath + ", imgName=" + imgName
				+ "]";
	}

	

}
