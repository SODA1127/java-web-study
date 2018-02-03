package com.itwill.guest;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 * - DAO객체가 Connection을얻고 반납하는 기능을가진클래스
 * - 모든 DAO객체가 상속받아서사용 
 * 
 */
public class RdbmsDao {
	
	public Connection getConnection()throws Exception{
		return ConnectionPool.getInstance().getConnection();
	}
	public void releaseConnection(Connection con) throws Exception{
		
		ConnectionPool.getInstance().releaseConnection(con);
		
		
	}
	
}










