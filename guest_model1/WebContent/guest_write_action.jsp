<%@page import="com.itwill.guest.GuestDao"%>
<%@page import="com.itwill.guest.Guest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("guest_main.jsp");
		return;
	}
	request.setCharacterEncoding("EUC-KR");
	String guest_name=request.getParameter("guest_name");
	String guest_email=request.getParameter("guest_email");
	String guest_homepage=request.getParameter("guest_homepage");
	String guest_title=request.getParameter("guest_title");
	String guest_content=request.getParameter("guest_content");
	Guest guest=new Guest(guest_name,guest_email,guest_homepage,guest_title,guest_content);
	GuestDao guestDao=new GuestDao();
	boolean insertOK=guestDao.insertGuest(guest);
	if(insertOK){
		response.sendRedirect("guest_list.jsp");
		
	}else{
		response.sendRedirect("guest_error.jsp");
	}	
%>
