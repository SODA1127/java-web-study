package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestViewController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String guest_noStr=request.getParameter("guest_no");
		if(guest_noStr==null|| guest_noStr.equals("")){
			forwardPath="redirect:guest_list.do";
		}else{
			try {
				GuestDao guestDao=new GuestDao();
				Guest guest=guestDao.selectByNo(Integer.parseInt(guest_noStr));
				request.setAttribute("guest",guest);
				forwardPath="forward:guest_view.jsp";
			} catch (Exception e){
				e.printStackTrace();
				forwardPath="forward:guest_error.jsp";
			}
		}
		return forwardPath;
	}

}
