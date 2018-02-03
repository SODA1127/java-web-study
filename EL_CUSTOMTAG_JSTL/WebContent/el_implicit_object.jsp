<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("path", "page.jsp");
	request.setAttribute("path", "request.jsp");
	request.setAttribute("a", "aaaa");
	request.setAttribute("b", "bbbb");
	request.setAttribute("c", "cccc");
	
	session.setAttribute("path", "session.jsp");
	application.setAttribute("path", "application.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>EL 내장객체</h1>
<ul>
	<li>-------- scope --------</li>
	<li>${path}</li>
	<li>${pageScope.path}</li>
	<li>${requestScope.path}</li>
	<li>${requestScope}</li>
	<li>${sessionScope.path}</li>
	<li>${applicationScope.path}</li>
	<li>-------- cookie --------</li>
	<li>${cookie}</li>
	<li>${cookie.JSESSIONID}</li>
	<li>${cookie.JSESSIONID.name}</li>
	<li>${cookie.JSESSIONID.value}</li>
	<li>-------- header --------</li>
	<li>${header}</li>
	<li>-------- param --------</li>
	<li>${param}</li>
	<li>-------- pageContext(Map아님) --------</li>
	<li>${pageContext}</li>
	<li>${pageContext.request.method}</li>
	<li>${pageContext.session.id}</li>
	<li>${pageContext.session.maxInactiveInterval}</li>
	<li>------- initParam -------</li>
	<li>${initParam}</li>
	
</ul>
</body>
</html>