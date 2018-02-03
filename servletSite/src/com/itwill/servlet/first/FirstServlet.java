package com.itwill.servlet.first;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
// @WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset = EUC-KR");
		PrintWriter out = response.getWriter();
		out.println("<p>");
		out.println("<center><H2>서블릿 잘났어 정말 별꼴이야!!!!!!!!!</H2><center>");
		out.println(
				"<img src='mime_type_image.do'/><center>");
		out.println("<H2>서블릿 구구단</H2></center>");
		out.println("<table border=1 width=600 bgcolor=#CCFF33 bordercolordark=#FF6600 cellspacing=0>");
		out.println("<tr>");
		out.println("</tr>");
		out.println("<tr>");
		boolean a = true;
		for (int i = 0; i <= 9; i++) {
			if (i == 0) {
				out.println("<tr><td style=\"text-align:center\" colspan=\"10\">여 히사시부리</td></tr>");
			}
			for (int j = 1; j <= 9; j++) {
				if (i == 1) {
					if (j == 1) {
						out.println("<tr><td align=center>" + j + "곱</td>");
					} else if (j > 1 && j < 9) {
						out.println("<td align=center>" + j + "곱</td>");
					} else {
						out.println("<td align=center>" + j + "곱</td><td style=\"text-align:center\" rowspan=\"10\">비</br>고</td></tr>");
						a = false;
					}
				}
				if (i > 1) {
					out.println("<td align=center>" + i + " x " + j + "=" + i * j + "</td>");
					if(j == 9 && a == false) {
						out.println("</tr>");
					}
				}
			}
		}
		out.println("</p>");
	}

}
