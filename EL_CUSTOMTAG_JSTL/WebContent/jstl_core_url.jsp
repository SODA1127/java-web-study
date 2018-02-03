<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("id", "guard");
	request.setAttribute("name", "김경호");
	request.setAttribute("addr", "인천 논현동");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core url tag</h1><hr/>
<c:url value="jstl_core_url_result.jsp" /><br/>
<c:url value="/jstl_core_url_result.jsp" /><br/>
<c:url value="./jstl_core_url_result.jsp" /><br/>
<c:url value="../jstl_core_url_result.jsp" /><br/>

<c:url value="jstl_core_url_result.jsp" var="url1"/>
<c:url value="/jstl_core_url_result.jsp" var="url2"/>
<c:url value="./jstl_core_url_result.jsp" var="url3"/>
<c:url value="../jstl_core_url_result.jsp" var="url4"/>

<c:url value="/jstl_core_url_result.jsp" var="url5" >
	<c:param name="id" value="${id}"/>
	<c:param name="name" value="${name}"/>
	<c:param name="pass" value="${'1111'}"/>
	<c:param name="hobby" value="${'no'}"/>
	<c:param name="addr" value="${addr}"/>
	<c:param name="gender" value="${'F'}"/>
	<c:param name="test" value="${'test'}"/>
	<c:param name="a" value="${1}"/>
</c:url>
<hr/>
<a href="<c:url value="/jstl_core_url_result.jsp"/>">jstl_core_url_result.jsp</a><br/>
<a href="${url1}">jstl_core_url_result.jsp</a><br/>
<a href="${url2}">jstl_core_url_result.jsp</a><br/>
<a href="${url3}">jstl_core_url_result.jsp</a><br/>
<a href="${url4}">jstl_core_url_result.jsp</a><br/>
<a href="${url5}">jstl_core_url_result.jsp[param]</a><br/>

<br/>
<br/>
<br/>
<br/>


<hr/>
<a href="jstl_core_url_result.jsp?addr=${addr}">jstl_core_url_result.jsp[param]</a><br/>
<a href="/jstl_core_url_result.jsp">/jstl_core_url_result.jsp</a><br/>
<a href="./jstl_core_url_result.jsp">./jstl_core_url_result.jsp</a><br/>
<a href="../jstl_core_url_result.jsp">../jstl_core_url_result.jsp</a><br/>

</body>
</html>