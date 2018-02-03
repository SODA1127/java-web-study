<%@page import="com.itwill.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("guest_main.jsp");
		return;
	}
/*
	1.파라메타바끼
	2.GuestDao.deleteByNo()호출
	3.성공시:guest_list.jsp redirection
	4.실패시:guest_view.jsp redirection
*/
	String guest_noStr=request.getParameter("guest_no");
	System.out.print(guest_noStr);
	GuestDao guestDao=new GuestDao();
    boolean isDelete=guestDao.deleteGuest(Integer.parseInt(guest_noStr));
    if(isDelete){
    	response.sendRedirect("guest_list.jsp");
    }else{
    	response.sendRedirect("guest_view.jsp?guest_no="+guest_noStr);
    }

%>