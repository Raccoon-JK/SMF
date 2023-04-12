package com.smf.style.model.vo;

public class PostImg {
		
	private int imgNo;			//	IMG_NO
	private int postNo;			//	POST_NO
	private String imgName;		//	IMG_NAME
	private String originName; 	// 변경된 파일이름
	private String imgPath;		//	IMG_PATH
	private String imgStatus;	//	IMG_STATUS
	private int imgLevel; 		// 파일 순서
	
	public PostImg() {
		super();
	}

	public PostImg(int imgNo, int postNo, String imgName, String originName, String imgPath, String imgStatus,
			int imgLevel) {
		super();
		this.imgNo = imgNo;
		this.postNo = postNo;
		this.imgName = imgName;
		this.originName = originName;
		this.imgPath = imgPath;
		this.imgStatus = imgStatus;
		this.imgLevel = imgLevel;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	@Override
	public String toString() {
		return "PostImg [imgNo=" + imgNo + ", postNo=" + postNo + ", imgName=" + imgName + ", originName=" + originName
				+ ", imgPath=" + imgPath + ", imgStatus=" + imgStatus + ", imgLevel=" + imgLevel + "]";
	}

	
	
	

}
