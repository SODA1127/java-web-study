package com.itwill.model2.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 클라이언트의 모든 요청을 받아서 처리하는 서블릿
 */
public class DispatcherServlet extends HttpServlet {
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 클라이언트 요청 분석(구분)
		 * 		ex> http://http://localhost:8080/model2/xxx.do
		 * 		<<요청 command>>
		 * 		/list.do
		 *  	/view.do
		 *  	/login.do
		 *  	/remove.do
		 * 		/update.do
		 * 		/menu.do
		 */
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
		
		
		/*
		 * 2. 클라이언트 요청에 따른 업무실행
		 */
		String fowardPath = "";
		if(command.equals("/menu.do")){
			fowardPath="menu.jsp";
		}else if(command.equals("/list.do")){
			/*
			 * 멤버 서비스의 메소드 호출
			 */
			ArrayList<String> memberList = new ArrayList<String>();
			memberList.add("신명숙");
			memberList.add("김은희");
			memberList.add("정봉화");
			
			/*
			 * JSP가 보여줘야 할 데이터를 요청객체에 추가
			 */
			request.setAttribute("memberList", memberList);
			fowardPath="list.jsp";
			
		}else if(command.equals("/view.do")){
			/*
			 * JSP가 보여줘야 할 데이터를 요청객체에 추가
			 */
			request.setAttribute("member","이효리");
			fowardPath="view.jsp";
			
		}else if(command.equals("/update.do")){
			fowardPath="update.jsp";
		}else if(command.equals("/login.do")){
			fowardPath="login.jsp";
		}else if(command.equals("/remove.do")){
			fowardPath="remove.jsp";
		}else if(command.equals("/image.do")){
			fowardPath="image.jpg";
		}else{
			/*
			 * JSP가 보여줘야 할 데이터를 요청객체에 추가
			 */
			request.setAttribute("MSG", "잘못된 요청입니다.");
			fowardPath="error.jsp";
		}
		
		/*
		 * 3. JSP 선택 후 포워딩
		 */
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/" + fowardPath);
		rd.forward(request, response);
	
		
		
		
	}
	
	

}
