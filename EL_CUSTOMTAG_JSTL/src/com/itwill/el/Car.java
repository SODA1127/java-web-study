package com.itwill.el;

public class Car {
	private String model;
	private String company;
	private int cc;
	
	public Car() {
		
	}
	
	public Car(String model, String company, int cc) {
		this.model = model;
		this.company = company;
		this.cc = cc;
	}

	public String getModel() {
		return model;
	}

	public String getCompany() {
		return company;
	}

	public int getCc() {
		return cc;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}
	
	
	
}
