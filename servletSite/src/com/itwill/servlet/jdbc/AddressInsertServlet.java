package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_insert.do")
public class AddressInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 패러미터 받기(5개)
		 */
		String no;
		String id;
		String name;
		String phone;
		String address;
		
		/*
		 * 2. 업무실행(가입)
		 */
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			AddressDao addressDao = new AddressDao();
			no = request.getParameter("no");
			id = request.getParameter("id");
			name = request.getParameter("name");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
			if((no == null) || (id == null) || (name == null) || (phone == null) || (address == null) ||
					(no.equals("")) || (id.equals("")) || (name.equals("")) || (phone.equals("")) || (address.equals(""))) {
					out.println("<script>alert('모두 입력되지 않아 리스트페이지로 이동합니다.'); location.href='address_list.do'</script>");
					//response.sendRedirect("address_list.do");
			}
			else {
				/*
				 * 3. 응답(redirection --> address_list.do)
				 */
				addressDao.insert(new Address(Integer.parseInt(no), id, name, phone, address));
				out.println("<h1>회원가입 완료</h1>");
				out.println("<a href='address_list.do'>리스트 페이지로 이동하기</a>");				
			}
		} catch (Exception e) {
			response.sendRedirect("08.address_insert_form.html");
			e.printStackTrace();
		}
		
	}

}
