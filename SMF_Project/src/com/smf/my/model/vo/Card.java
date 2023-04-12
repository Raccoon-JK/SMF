package com.smf.my.model.vo;

import java.sql.Date;

public class Card {
	private String userId;
	private int cardNo;
	private int cardPwd;
	private Date cardValidity; //카드유효기간 
	private int cvc;
	
	public Card() {
		super();
	}
	public Card(String userId, int cardNo, int cardPwd, Date cardValidity, int cvc) {
		super();
		this.userId = userId;
		this.cardNo = cardNo;
		this.cardPwd = cardPwd;
		this.cardValidity = cardValidity;
		this.cvc = cvc;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public int getCardPwd() {
		return cardPwd;
	}
	public void setCardPwd(int cardPwd) {
		this.cardPwd = cardPwd;
	}
	public Date getCardValidity() {
		return cardValidity;
	}
	public void setCardValidity(Date cardValidity) {
		this.cardValidity = cardValidity;
	}
	public int getCvc() {
		return cvc;
	}
	public void setCvc(int cvc) {
		this.cvc = cvc;
	}
	
	@Override
	public String toString() {
		return "Account [userId=" + userId + ", cardNo=" + cardNo + ", cardPwd=" + cardPwd + ", cardValidity="
				+ cardValidity + ", cvc=" + cvc + "]";
	}
}
