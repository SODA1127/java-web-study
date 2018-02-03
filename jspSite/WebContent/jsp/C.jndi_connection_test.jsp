<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@page import="javax.naming.Binding"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%
	/*
	   Naming Service참조변수
	*/

	/*
	결과
	   1|이기정|adsf
	   2|김경호2|guard@naver.com
	   3|김경호3|guard@naver.com
	   4|김경호4|guard@naver.com
	   Connection:1009949587, URL=jdbc:oracle:thin:@210.16.214.203:1521:xe, UserName=IOT33, Oracle JDBC driver
	*/

	InitialContext ic = new InitialContext();
	try {
		ic.rebind("addressDao", new AddressDao()); //binding
	} catch (Exception e) {
		e.printStackTrace();
	}
	Context webContext = (Context) ic.lookup("java:/comp/env");
	/*
	   Naming Service로부터 jdbc/OracleDB[JNDI NAME] 
	    으로 등록된 DataSource객체 lookup
	*/
	//DataSource ds = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");
	DataSource ds = (DataSource) webContext.lookup("jdbc/OracleDB");
	AddressDao addressDao = (AddressDao) ic.lookup("addressDao");
	Connection con = null;
	try {
		con = ds.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from guest");
		while (rs.next()) {
			out.println("<li>" + rs.getInt("guest_no") + "|" + rs.getString("guest_name") + "|"
					+ rs.getString("guest_email") + "</li>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<li>Connection:<%=con%></li>
<%
	con.close();
%>