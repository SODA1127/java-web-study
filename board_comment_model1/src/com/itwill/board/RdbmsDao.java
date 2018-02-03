package com.itwill.board;


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
	InitialContext ic;
	DataSource ds;
	Connection con;
	public Connection getConnection(){
		try{
			ic=new InitialContext();
			ds=(DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");
			con=ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public void releaseConnection(Connection con){
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}










