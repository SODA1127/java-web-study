<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*
pageContext.setAttribute("path", "page.jsp");
request.setAttribute("path", "request.jsp");
session.setAttribute("path", "session.jsp");
application.setAttribute("path", "application.jsp");
*/
Member m=new Member(1,"HONG",false,new Car("K5","KIA",3000));
request.setAttribute("member", m);
//session.setAttribute("member", m);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core set tag</h1>
	<c:set var="path" scope="page" value="page.jsp" />
	<c:set var="path" scope="request" value="request.jsp" />
	<c:set var="path" scope="session" value="session.jsp" />
	<c:set var="path" scope="application" value="application.jsp" />
	<c:set var="member" scope="request" value="<%=m %>" />
	<c:set var="member" scope="session" value="${member}" />
	<c:set var="age1" value="34"/>
	<c:set var="age2" value="${37}"/>
	<c:set var="name1" value="KIM"/>
	<c:set var="name2" value="${'KIM'}"/>
	<c:set var="test" value="${cookie.JSESSIONID.value}"/>	
	<ol>
	<li>${path}</li>
	<li>${pageScope.path}</li>
	<li>${requestScope.path}</li>
	<li>${sessionScope.path}</li>
	<li>${applicationScope.path}</li>
	<li>${member}</li>
	<li>${age1}</li>
	<li>${age2}</li>
	<li>${name1}</li>
	<li>${name2}</li>
	<li>${test}</li>
	
</ol>
</body>
</html>
