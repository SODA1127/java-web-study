package com.itwill.servlet.address;
/*
 * DTO(Data Transfer Object), VO(Value Object)
 */
public class Address {
	private int no;
	private String id;
	private String name;
	private String phone;
	private String address;
	
	public Address() {
	}
	
	public Address(int no, String id, String name, String phone, String address) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}

	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {
		return address;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	/*@Override
	public String toString() {
		return no + "\t" + id + "\t" + name + "\t" + phone + "\t" + address;
	}*/
	
}
