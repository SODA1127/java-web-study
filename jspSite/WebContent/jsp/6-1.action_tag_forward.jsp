<%@page import="com.itwill.servlet.address.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("6-1.action_forward.jsp");
	String fowardPath = "6-1.action_tag_forwarded.jsp";
	Address address = new Address(1, "xxx", "엑스", "111-1111", "서울시민");
	System.out.println("6-1.action_forward.jsp : " + address);
	
	request.setAttribute("v1", "soda");
	request.setAttribute("v2", address);
	
	RequestDispatcher rd = request.getRequestDispatcher("6-1.action_tag_forwarded.jsp");
	rd.forward(request, response);
%>

<%--
<jsp:forward page="6-1.action_tag_forwarded.jsp"></jsp:forward>
<jsp:forward page="<%=fowardPath %>"></jsp:forward>
--%>