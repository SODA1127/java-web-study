package com.itwill.servlet.request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HttpServletRequestServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String method = request.getMethod();
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String realPath = request.getRealPath("");
		StringBuffer requestURL = request.getRequestURL();
		String remoteAddress= request.getRemoteAddr();
		int remotePort= request.getRemotePort();
		/*
		 * 요청URL query string : request.do
		 * 요청URL query string : request.do?id=guard&pass=1111
		 * 요청URL query string : request.do?id=&pass=
		 */
		String queryString = request.getQueryString();
		/*
		 * 요청 패러미터 값 얻기
		 * 		- 패러미터 이름 : id, pass
		 * 		- 패러미터 값 : guard, 1111
		 * 
		 */
		
		 String id= request.getParameter("id");
		 String pass= request.getParameter("pass");
		 
		out.println("<h1>HttpServletRequestServlet</ht>");
		out.println("<ul>");
		out.println("<li>요청메소드 : " + method +"</li>");
		out.println("<li>요청 패러미터 id : " + id + " | pass : " + pass + "</li>");
		out.println("<li>contextPath : " + contextPath +"</li>");
		out.println("<li>requestURI : " + requestURI +"</li>");
		out.println("<li>realPath: " + realPath +"</li>");
		out.println("<li>requestURL : " + requestURL +"</li>");
		out.println("<li>remoteAddress : " + remoteAddress +"</li>");
		out.println("<li>remotePort : " + remotePort +"</li>");
		out.println("<li>queryString : " + queryString +"</li>");
		out.println("</ul>");
		out.println("<a href ='04.HttpServletRequest.html'>메인</a>");
		
	}
}







