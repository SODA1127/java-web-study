package com.itwill.user.common;

public class UserSQL {
	public final static String USER_SELECT_ALL = "select userid,password,name,email from userinfo order by userid";
	public final static String USER_SELECT_BY_ID = "select userid,password,name,email from userinfo where userid=?";
	public final static String INSERT_USERINFO = "insert into userinfo values(?,?,?,?)";
	public final static String UPDATE_USERINFO = "update userinfo set password=?,name=?,email=? where userid=?";
	public final static String REMOVE_USERINFO = "delete from userinfo where userid=?";
	public final static String CHECK_USER_BY_ID = "select count(*) cnt from userinfo where userid=?";
	
	
}
