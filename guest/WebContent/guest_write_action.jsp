<%@page import="com.itwill.guest.Guest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
1.파라메타받기
2.GuestDao.insert();
3.guest_list.jsp redirection
*/
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("guest_name");
	String email = request.getParameter("guest_email");
	String homepage = request.getParameter("guest_homepage");
	String title = request.getParameter("guest_title");
	String content = request.getParameter("guest_content");
	
	
	GuestDao guestDao = new GuestDao();
	Guest guest = new Guest();
	guest.setGuest_name(name);
	guest.setGuest_email(email);
	guest.setGuest_homepage(homepage);
	guest.setGuest_title(title);
	guest.setGuest_content(content);
	guestDao.insertGuest(guest);
	response.sendRedirect("guest_list.jsp");
	return;
%>