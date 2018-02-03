package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestModifyActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

		if (request.getMethod().equalsIgnoreCase("GET")) {
			// response.sendRedirect("guest_main.jsp");
			forwardPath = "redirect:guest_main.do";
			return forwardPath;
		}

		try {
			request.setCharacterEncoding("EUC-KR");
			String guest_no = request.getParameter("guest_no");
			String guest_name = request.getParameter("guest_name");
			String guest_email = request.getParameter("guest_email");
			String guest_homepage = request.getParameter("guest_homepage");
			String guest_title = request.getParameter("guest_title");
			String guest_content = request.getParameter("guest_content");
			Guest guest = new Guest(Integer.parseInt(guest_no), guest_name, "", guest_email, guest_homepage,
					guest_title, guest_content);
			GuestDao guestDao = new GuestDao();
			boolean updateOK = guestDao.updateGuest(guest);
			if (updateOK) {
				// response.sendRedirect("guest_list.jsp");
				forwardPath = "redirect:guest_view.do?guest_no=" + guest_no;
			} else {
				// response.sendRedirect("guest_error.jsp");
				request.setAttribute("MSG", guest_no + "번 수정실패!!!");
				forwardPath = "forward:guest_error.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath = "forward:guest_error.jsp";
		}

		return forwardPath;
	}

}
