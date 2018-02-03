package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;

/*
 * 클라이언트의 요청에 따른 업무실행 클래스
 */
public class GuestWriteController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String forwardPath="guest_write.jsp";
		
		return "foward:" + forwardPath;
	}
}
