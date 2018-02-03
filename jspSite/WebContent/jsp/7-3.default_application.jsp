<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>기본객체 application(ServletContect)</h1>
<hr/>
<ol>
<li>서버정보<%=application.getServerInfo()%></li>
<li>major version : <%=application.getMajorVersion()%></li>
<li>minor version : <%=application.getMinorVersion()%></li>
<li>context real path : <%=application.getRealPath("")%></li>
<li>log : <% application.log(">>>>>>>> 현재날짜:"+new Date().toString()); %></li>
<li>context path(parameter):<%=application.getInitParameter("contextPath")%>
</ol>
</body>
</html>