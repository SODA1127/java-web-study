package com.itwill.servlet.mtype;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mime.do")
public class MimeTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /*
     * Multitple Internet Mail Extention
     */
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type == null){
			type = "html";
		}
		if(type.equals("html")) {
			response.setContentType("text/html; charset=utf-8");			
		}else if(type.equals("plain")) {
			response.setContentType("text/plain; charset=utf-8");			
		}
		
		PrintWriter out = response.getWriter();
		out.println("<ol>");
		out.println("<lh>우리반 잘생긴 학생</lh>");
		out.println("<li>김재현</li>");
		out.println("<li>이대웅</li>");
		out.println("<li>김성연</li>");
		out.println("</ol>");
		
	}


}
