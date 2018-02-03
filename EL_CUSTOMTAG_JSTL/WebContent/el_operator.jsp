<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("string1", "문자열1");
	pageContext.setAttribute("string2", "문자열2");
	pageContext.setAttribute("int1", 10);
	pageContext.setAttribute("int2", 20);
	pageContext.setAttribute("double1", 1.14159);
	pageContext.setAttribute("double2", 2.3456);
	pageContext.setAttribute("boolean1", true);
	pageContext.setAttribute("boolean2", false);
	pageContext.setAttribute("age", 35);

	String nullObject = null;
	String nullString = "";
	ArrayList list = new ArrayList();
	HashMap map = new HashMap();
	pageContext.setAttribute("nullObject", nullObject);
	pageContext.setAttribute("nullString", nullString);
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("map", map);
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 연산자</h1><hr/>
	<ul>
		<li>${"문자열리터럴"}</li>
		<li>${'문자열리터럴'}</li>
		<li>${123}</li>
		<li>${123.789}</li>
		<li>${true}</li>
		<li>${false}</li>
		<li>${int1 + 10}</li>
		<li>${int1 - int2}</li>
		<li>${int1 / int2}</li>
		<li>${int1 * int2}</li>
		<li>${int1 % int2}</li>
		<li>${int1 + double1}</li>
		<li>${age}</li>
		
		<li>age >= 30 --> ${age >= 30}</li>		
		<li>age >= 30 && age <= 40 --> ${age >= 30 && age <= 40}</li>		
		<li>(age >= 30) && !(age <= 40) --> ${(age >= 30) && !(age <= 40)}</li>		
		<li>empry null --> ${empty nullObject}</li>
		<li>empry "" --> ${empty nullString}</li>
		<li>empty list --> ${empty list}</li>
		
		<li>empry map --> ${empty map}</li>
		<li>!empry map --> ${!empty map}</li>
		
	</ul>
</body>
</html>
