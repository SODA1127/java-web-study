<%@page import="com.itwill.servlet.address.Address"%>
<%@page import="com.itwill.servlet.address.AddressDao"%>
<%@page import="java.util.ArrayList"%>
<%-- 
중복 속성기술시 에러발생
<%@page contentType="text/html; charset=EUC-KR" %>
--%>
<%-- 
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="com.itwill.address.Address, com.itwill.address.AddressDao"
	%>
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>page 지시어 [import]</h1>
	<h2>형태:&lt;%@page import="com.itwill.Student"&gt;</h2>
	<hr />
	<%
		AddressDao addressDao=new AddressDao();
		ArrayList<Address> addressList=addressDao.selectAll();
	%>
	<%= addressList %>
	<h1>HTML,JSP comment[주석]</h1>
	<!-- 
<h2>난 HTML 주석</h2>
-->
	<%-- 
<h2>난 JSP 주석</h2>
--%>
</body>
</html>








