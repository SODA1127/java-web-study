package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestModifyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		if(request.getMethod().equalsIgnoreCase("GET")){
			//response.sendRedirect("guest_main.jsp");
			forwardPath="redirect:guest_main.do";
			return forwardPath;
		}
		
		String guest_noStr = request.getParameter("guest_no");
		System.out.println("guest_noStr : " + guest_noStr);
		if (guest_noStr == null || guest_noStr.equals("")) {
			// response.sendRedirect("guest_list.jsp");
			forwardPath = "redirect:guest_list.do";
		}else {
			GuestDao guestDao = new GuestDao();
			try {
				request.setCharacterEncoding("EUC-KR");
				Guest guest = guestDao.selectByNo(Integer.parseInt(guest_noStr));
				request.setAttribute("guest", guest);
				forwardPath="forward:guest_modify.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:guest_error.jsp";
			}
		}
		return forwardPath;
	}

}
