package com.itwill.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HelloController implements Controller {
	public HelloController() {
		System.out.println("#### HelloController() 컨트롤러 디폴트 생성자호출");
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardPath = "/WEB-INF/view/hello.jsp";
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(forwardPath);
		return modelAndView;
	}

}
