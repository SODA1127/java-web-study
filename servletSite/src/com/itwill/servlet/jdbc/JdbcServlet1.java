package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jdbc1.do")
public class JdbcServlet1 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE", "iot33", "iot33");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from emp");
			out.println("<ol>");
			out.println("<li>" + con + "</li>");
			out.println("<li>" + stmt + "</li>");
			out.println("<li>" + rs + "</li>");
			out.println("</ol>");
			
			out.println("<br>");
			out.println("<hr>");
			out.println("<br>");
			
			out.println("<ul>");
			out.println("<lh></lh>");
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int sal = rs.getInt("sal");
				out.println("<li>" + empno + ", " + ename + ", " + job + ", " + sal + "</li>");
			}
			out.println("</ul>");
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
			return;
		}
	}

}
