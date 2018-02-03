package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_delete.do")
public class AddressDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 패러미터 받기(5개)
		 */
		String no;

		/*
		 * 2. 업무실행(가입)
		 */
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			AddressDao addressDao = new AddressDao();
			no = request.getParameter("no");
			
			out.println("<h1>삭제완료</h1>");
			out.println("<a href='address_list.do'>리스트 페이지로 이동하기</a>");
			addressDao.deleteByNo(Integer.parseInt(no));
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("address_list.do");
		}
		/*
		 * 3. 응답(redirection --> address_list.do)
		 */
	}

}
