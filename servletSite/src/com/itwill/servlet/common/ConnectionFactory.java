package com.itwill.servlet.common;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
	/*
	 * 외부에서 객체생성을 금지
	 */
	
	private ConnectionFactory() {
		
	}
	
	public static Connection getConection(String driverClass, String url, String user, String password) throws Exception {
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
	
	public static Connection getConection() throws Exception{
		FileInputStream fis = new FileInputStream("/Users/leekijung/Documents/eclipse-workspace/servletSite/src/db.properties");
		Properties properties = new Properties();
		properties.load(fis);
		String driverClass = properties.getProperty("driver");
		String url = properties.getProperty("url");
		String user = properties.getProperty("user");
		String password = properties.getProperty("pass");
		return getConection(driverClass, url, user, password);
	}
	
	// Connection 해지
	public static void releaseConnection(Connection con) throws Exception{
		con.close();
		//System.out.println("Connection 해지");
	}
	
	
}
