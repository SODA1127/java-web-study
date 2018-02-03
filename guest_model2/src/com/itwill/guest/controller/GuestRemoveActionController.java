package com.itwill.guest.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestRemoveActionController implements Controller {

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
			String guest_noStr = request.getParameter("guest_no");
			GuestDao guestDao=new GuestDao();
			boolean deleteOK = guestDao.deleteGuest(Integer.parseInt(guest_noStr));
			if(deleteOK){
				//response.sendRedirect("guest_list.jsp");
				forwardPath = "redirect:guest_list.do";
			}else{
				//response.sendRedirect("guest_error.jsp");
				request.setAttribute("MSG", "삭제실패!!!");
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
