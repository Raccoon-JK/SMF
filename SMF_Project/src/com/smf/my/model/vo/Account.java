package com.smf.my.model.vo;

public class Account {
	private String userId; 
	private String bankName;
	private int	accountNo;
	private String accountHolder;
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(String userId, String bankName, int accountNo, String accountHolder) {
		super();
		this.userId = userId;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.accountHolder = accountHolder;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountHolder() {
		return accountHolder;
	}
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	
	@Override
	public String toString() {
		return "Card [userId=" + userId + ", bankName=" + bankName + ", accountNo=" + accountNo + ", accountHolder="
				+ accountHolder + "]";
	}
	
}
