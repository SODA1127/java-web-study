package com.itwill.servlet.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_search.do")
public class AddressSearchResultServlet extends HttpServlet {
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
			String id = request.getParameter("id");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			ArrayList<Address> addressList = addressDao.selectAll();
			ArrayList<Address> searchList = new ArrayList<Address>();
			
			if(!id.equals("")) {
				for (int i = 0; i < addressList.size(); i++) {
					if(addressList.get(i).getId().contains(id)) {
						searchList.add(addressList.get(i));
					}
				}
			}else {
				out.println("<script>alert('검색 항목이 입력되지 않아 리스트페이지로 이동합니다.'); location.href='address_list.do'</script>");
			}
			
			out.println("<html>");
			out.println("<head>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"com.css\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<br>");
			out.println("<p align=center><font size=5 color=#0000FF><a href='address_list.do'>◈◈ 리스트로 돌아가기 ◈◈</a></font><br>");
			if(searchList.size() != 0) {
				for (int i = 0; i < searchList.size(); i++) {
					out.println("<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>");
					out.println("<tr bgcolor=#000000 class=t1>");
					out.println("<td align=center height=20 width=25%><font color=#FFFFFF>번호</font></td>");
					out.println("<td align=center height=20 width=25%><font color=#FFFFFF>아이디</font></td>");
					out.println("<td align=center height=20 width=40%><font color=#FFFFFF>이름</font></td>");
					out.println("<td align=center height=20 width=10%><font color=#FFFFFF>삭제</font></td>");
					out.println("</tr>");
					out.println("<tr class=t>");
					out.println("<td align=center width=25% height=20><a href = 'address_detail.do?no=" + searchList.get(i).getNo() + "'>" + searchList.get(i).getNo() + "</a></td>");
					out.println("<td align=center width=25% height=20><a href = 'address_detail.do?no=" + searchList.get(i).getNo() + "'>" + searchList.get(i).getId() + "</a></td>");
					out.println("<td align=center width=40% height=20><a href = 'address_detail.do?no=" + searchList.get(i).getNo() + "'>" + searchList.get(i).getName() + "</a></td>");
					out.println("<td align=center width=10% height=20><a href = 'address_delete.do?no=" + searchList.get(i).getNo() + "'>삭제</a></td>");
					out.println("</tr>");
					out.println("</table>");
				}
			}else if(searchList.size() == 0) {
				out.println("<hr><h3>" + id + "가 포함되는 계정항목이 존재하지 않습니다.</h3><hr>");
			}
			out.println("<hr><form name='search' method='get' action = 'address_search.do'>ID 검색 : <input type='text' name = 'id'><input type='submit' value='검색'></input></form>");
			out.println("</body>");
			out.println("</html> ");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
			return;
		}
	}

}
