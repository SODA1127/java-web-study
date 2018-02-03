<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="loginCheck.jspf" %> 
<%
	//request.setCharacterEncoding("EUC-KR");
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_list.jsp");
		return;
	}
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	User updateUser=new User(sUserId,password,name,email);
	try{
		int result=UserService.getInstance().update(updateUser);
		session.setAttribute("sUser", updateUser);
		response.sendRedirect("user_myInfo_view.jsp");
	}catch(Exception e){
		response.sendRedirect("error/error.jsp");
	}
%>