<%@ page language="java" 
		 contentType="text/html; charset=EUC-KR"
    	 pageEncoding="EUC-KR"
    	 %>
<%@include file="user_login_check.jspf" %>   
<%
	session.invalidate();
	response.sendRedirect("user_main.jsp");
%>