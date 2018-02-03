package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_update.do")
public class AddressUpdateServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			AddressDao addressDao = new AddressDao();
			String no = request.getParameter("no");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			/*
			 * 1. 패러미터 받기 --> http://localhost:14924/servletSite/address_list.do?
			 */

			/*
			 * 2. Dao 메소드 호출
			 */
			Address address = addressDao.selectByNo(Integer.parseInt(no));
			System.out.println(address);

			/*
			 * 3. 응답
			 */
			out.println("<html>");
			out.println("<head>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"com.css\">");

			out.println("</head>");
			out.println("<body>");
			out.println("<br>");
			out.println(
					"<p align=center><font size=5 color=#0000FF><a href='address_detail.do?no=" + address.getNo() + "'>◈◈ 취소 ◈◈</a></font><br>");
			out.println("<form name=\"update\" method=\"post\" action='address_update_set.do'>");
			out.println(
					"<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>");
			out.println("<tr bgcolor=#000000 class=t1>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>번호</font></td>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>아이디</font></td>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>이름</font></td>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>폰</font></td>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>주소</font></td>");
			out.println("</tr>");
			out.println("<tr class=t>");
			out.println("<td align=center width=20% height=20><input type=\"text\" size=\"30\"\n" + 
					"name=\"no\" class=\"TXTFLD\" value='" + address.getNo() + "' readonly=\"readonly\"></td>");
			out.println("<td align=center width=20% height=20><input type=\"text\" size=\"30\"\n" + 
					"name=\"id\" class=\"TXTFLD\" value='" + address.getId() + "' placeholder='"+ address.getId() + "'></td>");
			out.println("<td align=center width=20% height=20><input type=\"text\"\n" + 
					"size=\"30\" name=\"name\" class=\"TXTFLD1\" value='" + address.getName() + "' placeholder='" + address.getName() + "'></td>");
			out.println("<td align=center width=20% height=20><input type=\"text\"\n" + 
					"size=\"30\" name=\"phone\" class=\"TXTFLD\" value='" + address.getPhone() + "' placeholder='" + address.getPhone() +"'></td>");
			out.println("<td align=center width=20% height=20><input type=\"text\"\n" + 
					"size=\"30\" name=\"address\" class=\"TXTFLD\" value='" + address.getAddress() + "' placeholder='" + address.getAddress() + "'></td>");
			out.println("</tr></table>");
			out.println("<hr>");
			out.println("<input type=\"submit\" value=\"수정\"></form>");
		} catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("error.html");
			return;
		}
	}

}
