package com.smf.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userName;
	private String userPwd;
	private String phone;
	private Date birth;
	private int userType;
	private String agreeEmail;
	private String status;
	private String userImg;
	private String interoduce;
	private Date enrollDate;
	private String snsId;
	private int totalPoint;
	private String address;
	
	

	public Member() {
		super();
	}
	
	public Member(String userId, String userName, String userPwd, String phone, Date birth, int userType,
			String agreeEmail, String status, String userImg, String interoduce, Date enrollDate, String snsId, int totalPoint) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.birth = birth;
		this.userType = userType;
		this.agreeEmail = agreeEmail;
		this.status = status;
		this.userImg = userImg;
		this.interoduce = interoduce;
		this.enrollDate = enrollDate;
		this.snsId = snsId;
		this.totalPoint = totalPoint;
	}
	//회원가입 시 사용되는 생성자
	public Member(String userId, String userName, String userPwd, String phone, Date birth, String agreeEmail, String snsId) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.birth = birth;
		this.agreeEmail = agreeEmail;
		this.snsId = snsId;
	}
	
	//로그인 시 사용되는 생성자
	public Member(String userId, String userName, String userPwd, String phone, Date birth, int userType, String agreeEmail,
			String userImg, String interoduce, String snsId, int totalPoint) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.birth = birth;
		this.userType = userType;
		this.agreeEmail = agreeEmail;
		this.userImg = userImg;
		this.interoduce = interoduce;
		this.snsId = snsId;
		this.totalPoint = totalPoint;
	}
	
	
	
	public Member(String userId, String userName, String phone, Date enrollDate, String address, String agreeEmail) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.address = address;
		this.agreeEmail = agreeEmail;
		
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getAgreeEmail() {
		return agreeEmail;
	}
	public void setAgreeEmail(String agreeEmail) {
		this.agreeEmail = agreeEmail;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getInteroduce() {
		return interoduce;
	}
	public void setInteroduce(String interoduce) {
		this.interoduce = interoduce;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", phone=" + phone
				+ ", birth=" + birth + ", userType=" + userType + ", agreeEmail=" + agreeEmail + ", status=" + status
				+ ", userImg=" + userImg + ", interoduce=" + interoduce + ", enrollDate=" + enrollDate + ", snsId="
				+ snsId + ", totalPoint=" + totalPoint + "]";
	}

}