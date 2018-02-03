
<%@page import="com.itwill.servlet.address.Address"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	Address pageAddress=new Address();
	Address requestAddress=new Address();
	Address sessionAddress=new Address();
	Address applicationAddress=new Address();

	

	pageContext.setAttribute("pageAddress", pageAddress);	   	//page
	request.setAttribute("requestAddress", requestAddress);  				//request
	session.setAttribute("sessionAddress", sessionAddress); 				//session
	application.setAttribute("applicationAddress", applicationAddress);	//application

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>SCOPE객체</h1>

<ol>
	<li>page:<%=pageContext.getAttribute("pageAddress")%></li>
	<li>request:<%=request.getAttribute("requestAddress")%></li>
	<li>session:<%=session.getAttribute("sessionAddress")%></li>
	<li>application:<%=application.getAttribute("applicationAddress")%></li>
</ol> 
<br/>
include
<hr/>
<jsp:include page="8-1.default_scope_request.jsp"></jsp:include>
<hr/>
include
<a href='8-1.default_scope_page_session_application.jsp'>8-1.default_scope_page_session_application.jsp</a><br/>

</body>
</html>







