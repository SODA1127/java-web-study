package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;

public class GuestBadCommandController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		request.setAttribute("MSG", "잘못된 요청입니다.");
		forwardPath="guest_main.jsp";
		return "foward:" + forwardPath;
	}

}
