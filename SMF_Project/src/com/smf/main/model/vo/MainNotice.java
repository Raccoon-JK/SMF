package com.smf.main.model.vo;

public class MainNotice {
	private String alertTitle;

	public MainNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MainNotice(String alertTitle) {
		super();
		this.alertTitle = alertTitle;
	}

	public String getAlertTitle() {
		return alertTitle;
	}

	public void setAlertTitle(String alertTitle) {
		this.alertTitle = alertTitle;
	}

	@Override
	public String toString() {
		return "MainNotice [alertTitle=" + alertTitle + "]";
	}
}