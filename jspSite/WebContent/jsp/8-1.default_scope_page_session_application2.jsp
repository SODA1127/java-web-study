<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>SCOPE객체2</h1>

<ol>
	<li>page:<%=pageContext.getAttribute("pageAddress")%></li>
	<li>request:<%=request.getAttribute("requestAddress")%></li>
	<li>session:<%=session.getAttribute("sessionAddress")%></li>
	<li>application:<%=application.getAttribute("applicationAddress")%></li>
</ol> 
<br/>
<a href='8-1.default_scope.jsp'>8-1.default_scope.jsp</a><br/>

</body>
</html>







