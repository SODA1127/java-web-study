<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="UTF-8">
<%
	/*
		1. 파라메타바끼
		2. GuestDao.updateGuest()호출
		3. 성공시:guest_view.jsp 로 redirection
		3. 실패시:guest_list.jsp 로 redirection
	*/
	try {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("guest_name");
		String email = request.getParameter("guest_email");
		String homepage = request.getParameter("guest_homepage");
		String title = request.getParameter("guest_title");
		String content = request.getParameter("guest_content");
		String no = request.getParameter("guest_no");

		GuestDao guestDao = new GuestDao();
		Guest guest = new Guest();
		guest.setGuest_name(name);
		guest.setGuest_email(email);
		guest.setGuest_homepage(homepage);
		guest.setGuest_title(title);
		guest.setGuest_content(content);
		guest.setGuest_no(Integer.parseInt(no));
		guestDao.updateGuest(guest);
		response.sendRedirect("guest_view.jsp?guest_no=" + no);
		return;
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("guest_list.jsp");
		//response.sendRedirect("error_404.html");
	}
%>