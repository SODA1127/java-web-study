package com.itwill.servlet.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "join", urlPatterns = { "/join.do" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("05-03.form.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		/*
		 * 1. 패러미터 받기 2. 업무 실행 3. 클라이언트 응답(redirection)
		 */
		// 요청에서 패러미터 데이터의 인코딩 설정을 해줘야함
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String addr = request.getParameter("addr");
		String job = request.getParameter("job");
		String[] hobbies = request.getParameterValues("hobby");

		/*
		 * DB INSERT
		 */
		out.println("<html>" + "<head>" + "<title>가입완료</title>" + "<meta charset=\"utf-8\" />" + "</head>"
				+ "<body>" + "	<h1 style=\"text-align: center\">가입완료</h1>"
				+ "	<hr align=\"center\" width=\"300px\" />" + "</br>");
		out.println("<table border=\"1\" width=\"250px\" height=\"150px\" align=\"center\">");
		out.println("<tr><td style=\"text-align: center\" colspan=\"2\">가입정보</td></tr>");
		out.println("<tr><td style=\"text-align: center\">아이디</td><td style=\"text-align: center\">" + id + "</td></tr>");
		out.println("<tr><td style=\"text-align: center\">이름</td><td style=\"text-align: center\">" + name + "</td></tr>");
		out.println("<tr><td style=\"text-align: center\">성별</td><td style=\"text-align: center\">" + gender + "</td></tr>");
		out.println("<tr><td style=\"text-align: center\">주소</td><td style=\"text-align: center\">" + addr + "</td></tr>");
		out.println("<tr><td style=\"text-align: center\">직업</td><td style=\"text-align: center\">" + job + "</td></tr>");
		out.println("<tr><td style=\"text-align: center\" rowspan=4>취미</td>");
		for (int i = 0; i < hobbies.length; i++) {
			String hobby = hobbies[i];
			out.println("<td style=\"text-align: center\">" + hobby + "</td></tr><tr>");
		}
		out.println("</table></body></html>");
		
	}

}
