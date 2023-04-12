package com.smf.my.model.vo;

public class ReplacePhoneNumber {

	public static String repacePhoneNo(String phoneNo) {
		if (phoneNo == null) {
			return "";
		}
		if (phoneNo.length() == 8) {
			return phoneNo.replaceFirst("^[0-9]{4})([0-9]{4})$", "$1-$2");
		} else if (phoneNo.length() == 12) {
			return phoneNo.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4}$", "$1-$2-$3");
		}
		return phoneNo.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
	}
}
