<%@page import="com.itwill.el.Car"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("string", "±è°æÈ£");	
	session.setAttribute("sUserId", "guard");
	request.setAttribute("count", new Integer(34));
	request.setAttribute("isMarried", new Boolean(true));
	request.setAttribute("height", 182.23);
	request.setAttribute("weight", 64.78);
	Car c = new Car("K5", "KIA", 2000);
	request.setAttribute("car", c);
%>

<jsp:forward page="el_wrapper_string.jsp"/>  