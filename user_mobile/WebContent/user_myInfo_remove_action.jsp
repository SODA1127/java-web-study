<%@page import="com.itwill.user.UserService"%>
<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="loginCheck.jspf"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_main.jsp");
		return;
	}
	try{
		int result=UserService.getInstance().remove(sUserId);
		//����
		response.sendRedirect("user_logout_action.jsp");
		//�α׾ƿ�
	}catch(Exception e ){
		response.sendRedirect("error/error.jsp");
	}
%>