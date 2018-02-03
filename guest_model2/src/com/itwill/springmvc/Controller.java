package com.itwill.springmvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 클라이언트 요청에 따른 업무실행 객체가 반드시 구현해야 하는 인터페이
 */
public interface Controller {

	String handleRequest(HttpServletRequest request, HttpServletResponse response);

}