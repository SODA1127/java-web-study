<%@page import="com.itwill.el.Member"%>
<%@page import="com.itwill.el.Car"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Car c = new Car("K5", "KIA", 2000);
	request.setAttribute("car", c);

	Member m = new Member(1, "KIM", true, c);
	request.setAttribute("member", m);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL Bean 출력</h1>
	<hr />
	<ul>
		<li>----car----</li>
		<li>${car}</li>
		<li>${car.model}</li>
		<li>${car.getModel()}</li>
		<li>${car.company}</li>
		<li>${car.cc + 1000}</li>
		<li>----member----</li>
		<li>${member}</li>
		<li>${member.no}</li>
		<li>${member.name}</li>
		<li>${member.married}</li>
		<li>${member.car.model}</li>
		<li>${member.car.company}</li>
		<li>${member.car.cc}</li>
	</ul>
</body>
</html>