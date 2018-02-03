package com.itwill.guest;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RdbmsDao {

	public Connection getConnection() throws Exception {
		return ConnectionPool.getInstance().getConnection();
	}

	public void releaseConnection(Connection con) throws Exception {
		ConnectionPool.getInstance().releaseConnection(con);
	}

}
