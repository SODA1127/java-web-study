package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_detail.do")
public class AddressDetailServlet extends HttpServlet {
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
					"<p align=center><font size=5 color=#0000FF><a href='address_list.do'>◈◈ 리스트로 돌아가기 ◈◈</a></font><br>");
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
			out.println("<td align=center width=20% height=20>" + address.getNo() + "</td>");
			out.println("<td align=center width=20% height=20>" + address.getId() + "</td>");
			out.println("<td align=center width=20% height=20>" + address.getName() + "</td>");
			out.println("<td align=center width=20% height=20>" + address.getPhone() + "</td>");
			out.println("<td align=center width=20% height=20>" + address.getAddress() + "</td>");
			out.println("</tr>");
			out.println("<hr>");
			out.println("<a href='address_update.do?no=" + address.getNo() + "'>계정 정보 수정하기</a>");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
			return;
		}
	}

}
