<%@page import="com.itwill.servlet.address.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String v1 = (String)request.getAttribute("v1");
	Address v2 = (Address)request.getAttribute("v2");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>6-1.action_forwarded.jsp</h1>
<hr>
<p>
	나는 6-1.action_forward.jsp에서 forwading
	당한 jsp입니다..
	제가 응답합니다.
</p>
<ol>
	<li>v1 : <%= v1 %></li>
	<li>v2 : <%= v2 %></li>
	
</ol>
</body>
</html>