package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_list.do")
public class AddressListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 패러미터 받기(5개)
		 */

		/*
		 * 2. 업무실행(가입)
		 */
		try {
			int pageNo = 0;
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			System.out.println("pageNo : " + pageNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("address_list.do");
		}
		/*
		 * 3. 응답(redirection --> address_list.do)
		 */
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			/*
			 * 1. Dao 변수선언 & 생성
			 */
			AddressDao addressDao = new AddressDao();
			/*
			 * 2. Dao 메서드 호출
			 */
			ArrayList<Address> addressList = addressDao.selectAll();
			int totalListCount = addressList.size();
			final int listCount = 10;
			int lastCount = 0;
			
			int totalPage = totalListCount / listCount;
			if(totalListCount % listCount > 0) {
				lastCount = totalListCount % listCount;
				totalPage ++;
			}
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<html>");
			out.println("<head>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"com.css\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<br>");
			out.println("<p align=center><font size=5 color=#0000FF>◈◈ JDBC 테스트 1◈◈</font><br>");
			out.println("<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>");
			out.println("<tr bgcolor=#000000 class=t1>");
			out.println("<td align=center height=20 width=10%><font color=#FFFFFF>리스트번호</font></td>");
			out.println("<td align=center height=20 width=25%><font color=#FFFFFF>계정번호</font></td>");
			out.println("<td align=center height=20 width=25%><font color=#FFFFFF>아이디</font></td>");
			out.println("<td align=center height=20 width=30%><font color=#FFFFFF>이름</font></td>");
			out.println("<td align=center height=20 width=10%><font color=#FFFFFF>삭제</font></td>");
			out.println("</tr>");
			
			for (int i = 0; i < addressList.size(); i++) {
				out.println("<tr class=t" + i + ">");
				out.println("<td align=center width=10% height=20><a href = 'address_detail.do?no=" + addressList.get(i).getNo() + "'>" + (i  + 1) + "</a></td>");
				out.println("<td align=center width=25% height=20><a href = 'address_detail.do?no=" + addressList.get(i).getNo() + "'>" + addressList.get(i).getNo() + "</a></td>");
				out.println("<td align=center width=25% height=20><a href = 'address_detail.do?no=" + addressList.get(i).getNo() + "'>" + addressList.get(i).getId() + "</a></td>");
				out.println("<td align=center width=30% height=20><a href = 'address_detail.do?no=" + addressList.get(i).getNo() + "'>" + addressList.get(i).getName() + "</a></td>");
				out.println("<td align=center width=10% height=20><a href = 'address_delete.do?no=" + addressList.get(i).getNo() + "'>삭제</a></td>");
				out.println("</tr>");
			}
			out.println("</table>");
			for (int i = 1; i <= totalPage; i++) {
				out.println("<a href='address_list.do?pageNo=" + i + "'>" + i + "번</a>");
			}
			out.println("<hr>");
			out.println("<a href='08.address_insert_form.html'>회원가입 페이지로 이동하기</a>");
			out.println("<br><form name='search' method='get' action = 'address_search.do'>ID 검색 : <input type='text' name = 'id'><input type='submit' value='검색'></input></form>");
			out.println("</body>");
			out.println("</html> ");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
			return;
		}
	}

}
