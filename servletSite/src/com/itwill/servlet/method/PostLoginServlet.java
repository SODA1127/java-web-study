package com.itwill.servlet.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "post_login", urlPatterns = { "/post_login.do" })
public class PostLoginServlet extends HttpServlet {
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1.service-->"+request.getMethod()+" 메쏘드");
		if(request.getMethod().equals("GET")) {
			this.doGet(request, response);
		}else if(request.getMethod().equals("POST")) {
			this.doPost(request, response);
		}
	}
	*/
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("05-02.login_post.html");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("2.doPost");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		/*
		 * 1.요청객체로부터 파라메타뽑기
		 * 
		 * 요청URL
		 *  -->http://localhost:14924/servletSite/get_login.do
		 * 
		 *  
		 */
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		if(id==null || pass==null ||id.equals("")||pass.equals("")) {
			response.sendRedirect("05-02.login_post.html");
			return;
		}
		
		/*
		 * 2. 업무실행(로그인)[Manager객체]
		 */
		/*
		 * id : guard
		 * pass : 1111 
		 */
		if(!(id.equals("guard")&& pass.equals("1111"))) {
			//로그인실패
			out.println("<h1>로그인실패[POST]</h1><hr/>");
			out.println("<p>"+id+"님 누구세요!!!</p>");
			out.println("<a href='05-01.login_post.html'>다시로그인</a>");
			return;
		}
		
		/*
		 * 3. 클라이언트 응답(HTML)
		 *   //로그인성공
		 */
		out.println("<h1>로그인성공[POST]</h1><hr/>");
		out.println("<p>"+id+"님 로그인성공</p>");
		out.println("<a href='05-02.login_post.html'>메인</a>");
	}

}