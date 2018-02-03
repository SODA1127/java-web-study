package com.itwill.guest.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestWriteActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		
		if(request.getMethod().equalsIgnoreCase("GET")){
			//response.sendRedirect("guest_main.jsp");
			forwardPath="redirect:guest_main.do";
			return forwardPath;
		}
		
		try {
			request.setCharacterEncoding("EUC-KR");
			GuestDao guestDao=new GuestDao();
			String guest_name=request.getParameter("guest_name");
			String guest_email=request.getParameter("guest_email");
			String guest_homepage=request.getParameter("guest_homepage");
			String guest_title=request.getParameter("guest_title");
			String guest_content=request.getParameter("guest_content");
			Guest guest=new Guest(guest_name,guest_email,guest_homepage,guest_title,guest_content);
			boolean insertOK = guestDao.insertGuest(guest);
			if(insertOK){
				//response.sendRedirect("guest_list.jsp");
				forwardPath = "redirect:guest_list.do";
			}else{
				//response.sendRedirect("guest_error.jsp");
				request.setAttribute("MSG", "쓰기실패!!!");
				forwardPath="forward:guest_error.jsp";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", "잘 모르는 실패!!!");
			forwardPath="forward:guest_error.jsp";
		}
		return forwardPath;
	}

}
