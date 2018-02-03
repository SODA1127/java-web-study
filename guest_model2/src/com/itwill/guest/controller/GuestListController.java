package com.itwill.guest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.springmvc.Controller;

public class GuestListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		GuestDao guestDao=new GuestDao();
		try {
			ArrayList<Guest> guestList = guestDao.selectAll();
			request.setAttribute("guestList", guestList);
			forwardPath="foward:guest_list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("MSG", e.getMessage());
			forwardPath="foward:guest_error.jsp";
		}
		
		return forwardPath;
	}

}
