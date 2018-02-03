package com.itwill.el;

public class Member {
	private int no;
	private String name;
	private boolean married;
	private Car car;
	
	public Member() {
	}
	
	public Member(int no, String name, boolean married, Car car) {
		super();
		this.no = no;
		this.name = name;
		this.married = married;
		this.car = car;
	}
	
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public boolean isMarried() {
		return married;
	}
	public Car getCar() {
		return car;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMarried(boolean married) {
		this.married = married;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	
	
}
