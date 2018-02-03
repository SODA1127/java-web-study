package com.itwill.servlet.jdbc;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jdbc2.do")
public class JdbcServlet2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			/*
			 * 1. Dao 변수선언 & 생성
			 */
			AddressDao addressDao = new AddressDao();
			/*
			 * 2. Dao 메서드 호출
			 */
			ArrayList<Address> addressList = addressDao.selectAll();
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<h1>회원 주소록</h1>");
			out.println("<br>");
			out.println("<hr>");
			out.println("<br>");
			out.println("<ul>");
			out.println("<lh></lh>");
			for (int i = 0; i < addressList.size(); i++) {
				Address address = addressList.get(i);
				out.println("<li>" + address + "</li>");
			}
			out.println("</ul>");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
			return;
		}
	}

}
