package com.itwill.servlet.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "get_login", urlPatterns = { "/get_login.do" })
public class GetLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		//System.out.println("2.doGet");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		/*
		 * 1.요청객체로부터 파라메타뽑기
		 * 
		 * 요청URL
		 *  -->http://localhost:14924/servletSite/get_login.do?id=guard&pass=1111
		 * 
		 *  
		 */
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		if(id==null || pass==null ||id.equals("")||pass.equals("")) {
			/*
			 -->http://localhost:14924/servletSite/get_login.do
		     -->http://localhost:14924/servletSite/get_login.do?id=&pass=
			 */
			response.sendRedirect("05-01.login_get.html");
			return;
		}
		
		/*
		 * 2. 업무실행(로그인)[Manager객체]
		 */
		/*
		 * id  :guard
		 * pass:1111 
		 */
		if(!(id.equals("guard")&& pass.equals("1111"))) {
			//로그인실패
			out.println("<h1>로그인실패[GET]</h1><hr/>");
			out.println("<p>"+id+"님 누구세요!!!</p>");
			out.println("<a href='05-01.login_get.html'>다시로그인</a>");
			return;
		}
		
		/*
		 * 3. 클라이언트 응답(HTML)
		 *   //로그인성공
		 */
		out.println("<h1>로그인성공[GET]</h1><hr/>");
		out.println("<p>"+id+"님 로그인성공</p>");
		out.println("<a href='05-01.login_get.html'>메인</a>");
	}

}

