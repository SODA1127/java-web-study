package com.itwill.user;

/*
 * ����ڰ����� ���Ͽ� �ʿ��� ������Ŭ����(VO,DTO)
 * USERINFO ���̺��� ���÷����ش��ϴ� ����� �������ִ�
 */

public class User {
	/*
	 * ===================================
	 *  �̸� 			��? 		����
	 * =================================== 
	 * USERID 		NOT NULL 	VARCHAR2(12) 
	 * PASSWORD 	NOT NULL 	VARCHAR2(12) 
	 * NAME 		NOT NULL 	VARCHAR2(20) 
	 * EMAIL 					VARCHAR2(50)
	 * ===================================
	 */
	private String userId;
	private String password;
	private String name;
	private String email;
	private String addr1;
	private String addr2;
	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String password, String name, String email) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	/*
	 *�о����� ��ġ���� �˻� 
	 */
	public boolean isMatchPassword(String password){
		boolean isMatch=false;
		if(this.password.equals(password)){
			isMatch=true;
		}
		return isMatch;
	}
	

}







