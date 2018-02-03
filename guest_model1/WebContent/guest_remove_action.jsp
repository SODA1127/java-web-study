<%@page import="com.itwill.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("guest_main.jsp");
		return;
	}
	/*
		1. 파라메타받기
		2. GuestDao.deleteGuest(no);
		3. guest_list.js redirection
	*/
	String guest_noStr = request.getParameter("guest_no");
	GuestDao guestDao=new GuestDao();
	boolean deleteOK=
			guestDao.deleteGuest(Integer.parseInt(guest_noStr));
	if(deleteOK){
		response.sendRedirect("guest_list.jsp");
	}else{
		response.sendRedirect("guest_error.jsp");
	}
	
%>