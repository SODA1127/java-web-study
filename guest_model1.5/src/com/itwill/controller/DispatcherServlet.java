package com.itwill.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

/*
 * 클라이언트의 모든 요청을 받아서 처리하는 서블릿
 */
public class DispatcherServlet extends HttpServlet {
	String forwardPath="";
	boolean isRedirect=false;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 클라이언트 요청 분석(구분)
		 * 		ex> http://http://localhost:8080/guest_model1.5/xxx.do
		 * 		<<요청 command>>
		 *  	/guest_main.do
		 * 		/guest_list.do
		 *  	/guest_view.do
		 * 		/guest_write.do
		 * 		/guest_write_action.do
		 * 		/guest_modify.do
		 * 		/guest_modify_action.do
		 *  	/guest_remove.do
		 * 		/guest_remove_action.do
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
	
		
		if(command.equals("/guest_main.do")){
			forwardPath = "guest_main.jsp";
			isRedirect = false;
		}
		
		else if(command.equals("/guest_list.do")){
			forwardPath="";
			isRedirect = false;
			
			GuestDao guestDao=new GuestDao();
			try {
				ArrayList<Guest> guestList = guestDao.selectAll();
				request.setAttribute("guestList", guestList);
				forwardPath="guest_list.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", e.getMessage());
				forwardPath="guest_error.jsp";
			}
		}
		
		else if(command.equals("/guest_view.do")){
			String guest_noStr = request.getParameter("guest_no");
			if (guest_noStr == null || guest_noStr.equals("")) {
				// response.sendRedirect("guest_list.jsp");
				forwardPath = "guest_list.do";
				isRedirect = true;
			} else {
				try {
					GuestDao guestDao = new GuestDao();
					Guest guest = guestDao.selectByNo(Integer.parseInt(guest_noStr));
					request.setAttribute("guest", guest);
					forwardPath="guest_view.jsp";
					isRedirect=false;
					
				} catch (Exception e) {
					e.printStackTrace();
					forwardPath="guest_error.jsp";
					isRedirect=false;
				}
			}
		}
		
		else if(command.equals("/guest_write.do")){
			forwardPath = "guest_write.jsp";
			isRedirect = false;
		}
		
		else if(command.equals("/guest_write_action.do")){
			if(request.getMethod().equalsIgnoreCase("GET")){
				//response.sendRedirect("guest_main.jsp");
				isRedirect = true;
				forwardPath="guest_main.do";
				if(isRedirect){
					response.sendRedirect(forwardPath);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher(forwardPath);
					rd.forward(request, response);
				}
				return;
			}
			
			request.setCharacterEncoding("EUC-KR");
			String guest_name=request.getParameter("guest_name");
			String guest_email=request.getParameter("guest_email");
			String guest_homepage=request.getParameter("guest_homepage");
			String guest_title=request.getParameter("guest_title");
			String guest_content=request.getParameter("guest_content");
			Guest guest=new Guest(guest_name,guest_email,guest_homepage,guest_title,guest_content);
			try {
				GuestDao guestDao=new GuestDao();
				boolean insertOK = guestDao.insertGuest(guest);
				if(insertOK){
					//response.sendRedirect("guest_list.jsp");
					isRedirect = true;
					forwardPath = "guest_list.do";
				}else{
					//response.sendRedirect("guest_error.jsp");
					request.setAttribute("MSG", "쓰기실패!!!");
					isRedirect = false;
					forwardPath="guest_error.jsp";
				}			
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", "잘 모르는 실패!!!");
				isRedirect=false;
				forwardPath="guest_error.jsp";
			}
		}
		
		else if(command.equals("/guest_modify.do")){
			String guest_noStr = request.getParameter("guest_no");
			if (guest_noStr == null || guest_noStr.equals("")) {
				// response.sendRedirect("guest_list.jsp");
				forwardPath = "guest_list.do";
				isRedirect = true;
			}else {
				GuestDao guestDao = new GuestDao();
				try {
					Guest guest = guestDao.selectByNo(Integer.parseInt(guest_noStr));
					request.setAttribute("guest", guest);
					forwardPath="guest_modify.jsp";
					isRedirect=false;
				} catch (Exception e) {
					e.printStackTrace();
					forwardPath="guest_error.jsp";
					isRedirect=false;
				}
			}
		}
		
		else if(command.equals("/guest_modify_action.do")){
			if(request.getMethod().equalsIgnoreCase("GET")){
				//response.sendRedirect("guest_main.jsp");
				isRedirect = true;
				forwardPath="guest_main.do";
				if(isRedirect){
					response.sendRedirect(forwardPath);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher(forwardPath);
					rd.forward(request, response);
				}
				return;
			}
			
			request.setCharacterEncoding("EUC-KR");
			String guest_no=request.getParameter("guest_no");
			String guest_name=request.getParameter("guest_name");
			String guest_email=request.getParameter("guest_email");
			String guest_homepage=request.getParameter("guest_homepage");
			String guest_title=request.getParameter("guest_title");
			String guest_content=request.getParameter("guest_content");
			Guest guest= new Guest(Integer.parseInt(guest_no),guest_name,"",guest_email,guest_homepage,guest_title,guest_content);
			try {
				GuestDao guestDao=new GuestDao();
				boolean updateOK = guestDao.updateGuest(guest);
				if(updateOK){
					//response.sendRedirect("guest_list.jsp");
					isRedirect = true;
					forwardPath = "guest_view.do?guest_no="+guest_no;
				}else{
					//response.sendRedirect("guest_error.jsp");
					request.setAttribute("MSG", guest_no + "번 수정실패!!!");
					isRedirect = false;
					forwardPath="guest_error.jsp";
				}			
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", "잘 모르는 실패!!!");
				isRedirect=false;
				forwardPath="guest_error.jsp";
			}
		}
		
		else if(command.equals("/guest_remove_action.do")){
			if(request.getMethod().equalsIgnoreCase("GET")){
				//response.sendRedirect("guest_main.jsp");
				isRedirect = true;
				forwardPath="guest_main.do";
				if(isRedirect){
					response.sendRedirect(forwardPath);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher(forwardPath);
					rd.forward(request, response);
				}
				return;
			}
			
			request.setCharacterEncoding("EUC-KR");
			try {
				String guest_noStr = request.getParameter("guest_no");
				GuestDao guestDao=new GuestDao();
				boolean deleteOK = guestDao.deleteGuest(Integer.parseInt(guest_noStr));
				if(deleteOK){
					//response.sendRedirect("guest_list.jsp");
					isRedirect = true;
					forwardPath = "guest_list.do";
				}else{
					//response.sendRedirect("guest_error.jsp");
					request.setAttribute("MSG", "삭제실패!!!");
					isRedirect = false;
					forwardPath="guest_error.jsp";
				}			
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("MSG", "잘 모르는 실패!!!");
				isRedirect=false;
				forwardPath="guest_error.jsp";
			}
		}else{
			/*
			 * JSP가 보여줘야 할 데이터를 요청객체에 추가
			 */
			request.setAttribute("MSG", "잘못된 요청입니다.");
			forwardPath="guest_main.jsp";
		}
		
		/*
		 * 3. JSP 선택 후 포워딩
		 */
		if(isRedirect){
			response.sendRedirect(forwardPath);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/" + forwardPath);
			rd.forward(request, response);
		}
		
		
	}
	
	
	
	
	
	

}
