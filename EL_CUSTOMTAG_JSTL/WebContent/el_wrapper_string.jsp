<%@page import="com.itwill.el.Car"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String string = (String) request.getAttribute("string");
	String sUserId = (String) session.getAttribute("sUserId");
	int count = (Integer) request.getAttribute("count");
	boolean isMarried = (Boolean) request.getAttribute("isMarried");
	double height = (Double) request.getAttribute("height");
	double weight = (Double) request.getAttribute("weight");

	Car c = (Car) request.getAttribute("car");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>EL Wrapper String 출력</h1>
	<hr />
	<ol>
		<li>---NO EL---</li>
		<li><%=string%></li>
		<li><%=sUserId%></li>
		<li><%=count%></li>
		<li><%=isMarried%></li>
		<li><%=height%></li>
		<li><%=weight%></li>
		<li><%=c%></li>
		<li><%=c.getModel()%></li>
		<li><%=c.getCompany()%></li>
		<li><%=c.getCc()%></li>
		<li>---EL---</li>
		<li>${string}</li>
		<li>${sUserId}</li>
		<li>${count}</li>
		<li>${isMarried}</li>
		<li>${height}</li>
		<li>${weight}</li>
		<li>${car}</li>
		<li>${car.model}</li>
		<li>${car.company}</li>
		<li>${car.cc}</li>
	</ol>
</body>
</html>