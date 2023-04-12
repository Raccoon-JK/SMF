package com.smf.my.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplaceDateFormat {
	
	public static String repaceDate(String inputStr) {
		Date date = null;
		String outputDatestr = null;
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("MM/yy");
		try {
			date = inputDateFormat.parse(inputStr);
			System.out.println(date);
			SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			outputDatestr = outputDateFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return outputDatestr;
	}
	
	//안 씀
//	public static String ResoreDate(java.sql.Date inputDate) {
//		SimpleDateFormat outputDateFormat = new SimpleDateFormat("MM/yy");
//		String outputDatestr = outputDateFormat.format(inputDate);
//		return outputDatestr;
//	}
}
