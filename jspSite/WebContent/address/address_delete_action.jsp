<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try {
	request.setCharacterEncoding("UTF-8");
	String noStr = request.getParameter("no");
	AddressDao addressDao = new AddressDao();
	addressDao.deleteByNo(Integer.parseInt(noStr));
	response.sendRedirect("address_list.jsp");
	return;
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("error.html");
}
%>