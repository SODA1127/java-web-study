<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
try {
	request.setCharacterEncoding("UTF-8");
	String noStr = request.getParameter("no");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("address");
	AddressDao addressDao = new AddressDao();
	addressDao.update(new Address(Integer.parseInt(noStr), id, name, phone, addr));
	response.sendRedirect("address_detail.jsp?no=" + noStr);
	return;
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("error.html");
}
%>