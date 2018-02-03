package com.itwill.servlet.response;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HttpServletResponseServlet
 */
@WebServlet(name = "response", urlPatterns = { "/response.do" })
public class HttpServletResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		/*
		 * 요청URL --> 192.168.12.33:8888/servletSite/response.do -->
		 * 192.168.12.33:8888/servletSite/response.do?cmd=1 -->
		 * 192.168.12.33:8888/servletSite/response.do?cmd=2 -->
		 * 192.168.12.33:8888/servletSite/response.do?cmd=3
		 * 
		 */
		String cmd = request.getParameter("cmd");
		if (cmd == null) {
			response.sendRedirect("04.HttpServletResponse.html");
			return;
		} else if (cmd.equals("1")) {
			out.println("<h1>정상응답</h1><hr>");
			return;
		} else if (cmd.equals("2")) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			// response.sendError(403);
			return;
		} else if (cmd.equals("3")) {
			// response.sendRedirect("http://www.naver.com");
			response.sendRedirect("04.servletapi.html");
			out.println("<h1>Redirect</h1><hr>");
			return;
		} else {
			response.sendRedirect("04.HttpServletResponse.html");
		}

	}

}
