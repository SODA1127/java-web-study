<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="simple" uri="http://www.itwill.co.kr/jsp/simpleTag" %>
<%@ taglib prefix="sf" uri="http://www.itwill.co.kr/jsp/simpleFunc" %>

<%
	request.setAttribute("name", "LEE KI JUNG");
	request.setAttribute("price", "850000");
	request.setAttribute("imageFile", "a.jpg");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EL function</h1><hr/>
${fn:toLowerCase(name)}<br/>
${name.toLowerCase()}<br/>
${sf:decimalFormat(price,"#,###,###.00") }<br/>
${fn:endsWith(imageFile, '.jpg') }

</body>
</html>