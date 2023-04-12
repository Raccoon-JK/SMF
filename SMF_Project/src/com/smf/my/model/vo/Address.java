package com.smf.my.model.vo;

public class Address {
	private int addressNo;			//	ADDRESS_NO
	private String userId;			//	USER_ID
	private String receiver;		//  RECEIVER
	private String phone;			//  phone;
	private int postcode;			//	POSTCODE
	private String address;			//	ADDRESS
	private String defaultAddress;	//	DEFAULT_ADDRESS
	
	public Address() {
		super();
	}
	public Address(int addressNo, String userId, String receiver, String phone, int postcode, String address,
			String defaultAddress) {
		super();
		this.addressNo = addressNo;
		this.userId = userId;
		this.receiver = receiver;
		this.phone = phone;
		this.postcode = postcode;
		this.address = address;
		this.defaultAddress = defaultAddress;
	}
	public Address(int addressNo, String userId, String receiver, String phone, int postcode, String address) {
		this.addressNo = addressNo;
		this.userId = userId;
		this.receiver = receiver;
		this.phone = phone;
		this.postcode = postcode;
		this.address = address;
	}
	public Address(String userId, String receiver, String phone, int postcode, String address) {
		this.userId = userId;
		this.receiver = receiver;
		this.phone = phone;
		this.postcode = postcode;
		this.address = address;
	}
	
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDefaultAddress() {
		return defaultAddress;
	}
	public void setDefaultAddress(String defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
	
	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", userId=" + userId + ", receiver=" + receiver + ", phone=" + phone
				+ ", postcode=" + postcode + ", address=" + address + ", defaultAddress=" + defaultAddress + "]";
	}
	
}
