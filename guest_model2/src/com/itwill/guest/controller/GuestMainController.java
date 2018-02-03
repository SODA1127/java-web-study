package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.springmvc.Controller;

/*
 * 클라이언트의 요청에 따른 업무실행 클래스
 */
public class GuestMainController implements Controller {
	
	public GuestMainController() {
		System.out.println("GuestMainController 기본생성자");
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="guest_main.jsp";
		return "foward:" + forwardPath;
	}
}
